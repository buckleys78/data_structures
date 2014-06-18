class MergeSort

  def self.sort_it(a)

    return a if a.length < 2

    # left,right = a.each_slice( (a.size/2.0).round ).to_a
    l_size = a.length / 2
    r_size = a.length - l_size
    left = a.slice(0, l_size)
    right = a.slice(l_size, r_size)

    left_sorted = sort_it(left)
    right_sorted = sort_it(right)

    return self.merge_it left_sorted, right_sorted
  end

private
  def self.merge_it (left, right)
    merged_arry = []
    while left.length > 0 && right.length > 0 do
      if left[0] < right[0]
        merged_arry << left.shift
      else
        merged_arry << right.shift
      end
    end
    return merged_arry + left + right
  end
end
