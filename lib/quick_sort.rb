class QuickSort

  def self.sort_it(arry, i=0, k=arry.length - 1)
    @arry = arry
    if i < k
      p = partition(i, k)
      sort_it(@arry, i, p-1)
      sort_it(@arry, p+1, k)
    end

    return @arry
  end

private
  def self.partition (left_index, right_index)
    pivot_index = left_index + (right_index - left_index) / 2
    pivot_value = @arry[pivot_index]

    #swap: put pivot to the right
    @arry[pivot_index], @arry[right_index] = @arry[right_index], @arry[pivot_index]
    store_index = left_index

    (left_index...right_index).each do |i|
      unless @arry[i] > pivot_value
        @arry[store_index], @arry[i] = @arry[i], @arry[store_index]
        store_index += 1
      end
    end
    @arry[store_index], @arry[right_index] = @arry[right_index], @arry[store_index]
    return store_index
  end
end
