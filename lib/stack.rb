require 'node'

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


