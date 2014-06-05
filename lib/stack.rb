class Stack
  attr_accessor :head, :size

  def initialize
    @size = 0
  end

  def push(value)
    @head = Node.new(value, @head)
    @size += 1
  end

  def pop
    return nil if @size == 0
    value = @head.value
    @head = @head.next_node
    @size -= 1
    return value
  end
end

class Node
  attr_accessor :value, :next_node

  def initialize(value, next_node)
    @value = value
    @next_node = next_node
  end
end
