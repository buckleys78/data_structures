class Queue
  attr_accessor :first, :last, :size

  def initialize
    @size = 0
  end

  def enqueue(value)
    old_last = @last
    @last = Node.new(value, nil)
    if has_next?
      old_last.next_node = @last
    else
      @first = @last
    end
    @size += 1
  end

  def dequeue
    raise "Queue is empty" unless has_next?
    dequeued_node = @first
    @first = dequeued_node.next_node
    @size -= 1
    @last = nil unless has_next?
    return dequeued_node.value
  end

  def peek
    raise "Queue is empty" unless has_next?
    return @first.value
  end

private
  def has_next?
    @size > 0
  end
end

class Node
  attr_accessor :value, :next_node

  def initialize(value, next_node)
    @value = value
    @next_node = next_node
  end
end
