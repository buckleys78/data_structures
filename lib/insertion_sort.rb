class InsertionSort

  def self.sort_it(a)
    return a if a.length < 2

    # i = 1
    #until i == a.length do
    (1...a.length).each do |i|
      j = i
      test_val = a[i]
      while (j > 0 ) && (a[j-1] > test_val) do
        a[j] = a[j-1]
        j -= 1
      end
      a[j] = test_val
      #i += 1
    end
    return a
  end
end
