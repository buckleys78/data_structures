class HashTbl

  def initialize(size = 1024)
    @size = size
    @tbl =  Array.new(@size) { Array.new() }
  end

  def set(k,v)
    raise "Key is not a String" unless k.is_a? String
    @tbl[get_hash(k)] << {k => v}
  end

  def get(k)
    a = @tbl[get_hash(k)]
    hash = a.detect { |h| h.has_key?(k) }
    hash ? hash[k] : nil
  end

private
  def get_hash(key)
    key.each_byte.reduce(:+) % @size
  end
end
