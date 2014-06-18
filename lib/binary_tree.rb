class BinaryTree
  attr_accessor :value, :left, :right

  def initialize(value, left = nil, right = nil)
    @value = value
    @left = left
    @right = right
  end

  def print_pre_ordered
    str = "#{self.value}"
    str += " #{left.print_pre_ordered}" if left
    str += " #{right.print_pre_ordered}" if right
    return str
  end

  def print_post_ordered
    str = "#{right.print_pre_ordered}" if right
    str += " #{left.print_pre_ordered}" if left
    str += " #{self.value}"
    return str
  end

  def print_in_ordered
    str = "#{left.print_pre_ordered}" if left
    str += " #{self.value}"
    str += " #{right.print_pre_ordered}" if right
    return str
  end

end
