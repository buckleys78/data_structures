class MergeSort

  def self.sort_it(a)

    return a if a.length < 2

    left,right = a.each_slice( (a.size/2.0).round ).to_a

    left_sorted = sort_it(left)
    right_sorted = sort_it(right)

    return self.merge_it left_sorted, right_sorted
  end

  def self.merge_it (left, right)

    left_ptr = 0
    right_ptr = 0
    new_ptr = 0
    merged_arry = []
    while left_ptr < left.length && right_ptr < right.length do
      if left[left_ptr] < right[right_ptr]
        merged_arry[new_ptr] = left[left_ptr]
        left_ptr += 1
      else
        merged_arry[new_ptr] = right[right_ptr]
        right_ptr += 1
      end
      new_ptr += 1
    end
    until left_ptr == left.length do
      merged_arry << left[left_ptr]
      left_ptr += 1
    end
    until right_ptr == right.length do
      merged_arry << right[right_ptr]
      right_ptr += 1
    end
    return merged_arry
  end

end
