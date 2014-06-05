class LinkedList
  attr_accessor :head, :node_count

  def initialize
    @node_count = 0
  end

  def size
    @node_count
  end

  def insert_head(value)
    @head = Node.new(value, @head)
    @node_count += 1
  end

  def remove(node_to_delete)
    return nil if node_to_delete.nil?
    if @head.value == node_to_delete.value
      @head = @head.next_node
      return node_to_delete
    else
      current_node = @head.next_node
      prev_node = @head
    end
    while current_node
      if current_node.value == node_to_delete.value
        prev_node.next_node = current_node.next_node
        return node_to_delete
      end
      prev_node = current_node
      current_node = current_node.next_node
    end
    return nil
  end

  def search(value)
    node = @head
    while node != nil
      return node if node.value == value
      node = node.next_node
    end
    return nil
  end

  def to_s
    node = @head
    str = ""
    while node != nil
      if node.value.kind_of? Integer or node.value.kind_of? Float
        this_str = "#{node.value}"
      elsif node.value.kind_of? Symbol
        this_str = ":#{node.value}"
      else
        this_str = "'#{node.value}'"
      end
      str += this_str
      str += ", " if node.next_node != nil
      node = node.next_node
    end
    return str
  end

end

class Node
  attr_accessor :value, :next_node

  def initialize(value, next_node)
    @value = value
    @next_node = next_node
  end
end
