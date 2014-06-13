class RadixSort

  def self.sort_it(arry)
    return arry if arry.length < 2
    a = arry
    passes = [a.min.abs, a.max.abs].max.to_s.length
    passes.times do |i|
      bkt =  Array.new(20) { Array.new() }
      a.each do |val|
        indx = get_index(val, i+1)
        bkt[indx] << val unless indx.nil?
      end
      a = bkt.flatten.compact
    end
    return a
  end

private
  def self.get_index(val, n)
    digit_arry = split_integer_into_arry_of_digits(val)
    return 0 if n > digit_arry.length
    digit = digit_arry[n-1]
    if val < 0
      return digit > 0? 10 - digit : 0
    else
      return 10 + digit
    end
  end

  def self.split_integer_into_arry_of_digits(val)
    return [0] if val == 0
    digits = []
    quotient = val.abs
    while quotient > 0 do
      quotient, modulus = quotient.divmod(10)
      digits.unshift(modulus)
    end
    return digits
  end
end
