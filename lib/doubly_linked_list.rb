require 'd_node'

class DoublyLinkedList
  attr_accessor :head, :tail, :node_count

  def initialize
    @node_count = 0
    @head = D_Node.new(nil)
    @tail = D_Node.new(nil)
    @head.next_node = @tail
    @tail.prev_node = @head
  end

  def size
    @node_count
  end

  def empty?
    @node_count == 0
  end

  def add(value)
    last_node = @tail.prev_node
    new_node = D_Node.new(value, @tail, last_node)
    @tail.prev_node = new_node
    last_node.next_node = new_node
    @node_count += 1
  end

  def remove(node_to_delete)
    return nil if empty? || node_to_delete.nil?
    prev_node = node_to_delete.prev_node
    next_node = node_to_delete.next_node
    prev_node.next_node = next_node
    next_node.prev_node = prev_node
    @node_count -= 1
    return nil
  end

  def remove_duplicates_fast()
    dups_removed = 0
    return dups_removed if size < 2
    hash_table = Hash.new
    node = @tail.prev_node
    size.times {
      if hash_table[node.value].nil?
        hash_table[node.value] = 1
      else
        remove(node)
        dups_removed += 1
      end
      node = node.prev_node
    }
    return dups_removed
  end

  def remove_duplicates_thin()
    dups_removed = 0
    return dups_removed if size < 2
    node = @head.next_node
    until node.next_node.nil?
      test_node = node.next_node
      until test_node == @tail
        if test_node.value == node.value
          remove test_node
          dups_removed += 1
        end
        test_node = test_node.next_node
      end
      node = node.next_node
    end
    return dups_removed
  end

  def search(value)
    node = @head.next_node
    until node.nil?
      return node if node.value == value
      node = node.next_node
    end
    return nil
  end

  def to_s
    node = @head.next_node
    str = ""
    until node == @tail
      if node.value.kind_of? Integer or node.value.kind_of? Float
        this_str = "#{node.value}"
      elsif node.value.kind_of? Symbol
        this_str = ":#{node.value}"
      else
        this_str = "'#{node.value}'"
      end
      str += this_str
      str += ", " unless node.next_node == @tail
      node = node.next_node
    end
    return str
  end

end

