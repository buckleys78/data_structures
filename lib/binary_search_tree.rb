require 'bt_node'
require 'queue'

class BinarySearchTree

  def initialize
    @size = 0
    @overall_root = nil
  end

  def size
    @size
  end

  def insert(val)
    return false if contains(val)
    @overall_root = subtree_add(@overall_root, val)
    @size += 1
  end

  def contains(val, node = @overall_root)
    return false unless node
    if val == node.value
      return true
    elsif val < node.value
      contains(val, node.left)
    else  #comp > 0
      contains(val, node.right)
    end
  end

  def depth(node = @overall_root)
    return 0 unless node
    dl = node.left ? depth(node.left) : 0
    dr = node.right ? depth(node.right) : 0
    return 1 + [dl, dr].max
  end

  def balance
    return 0 if @size < 2
    lc = subtree_count(@overall_root.left)
    rc = subtree_count(@overall_root.right)
    return lc - rc
  end

  def print_breadth_first
    return unless @overall_root
    str = ""
    bfq = Queue.new
    bfq.enqueue @overall_root
    until bfq.empty?
      dq_node = bfq.dequeue
      str += "#{dq_node.value} "
      bfq.enqueue dq_node.left if dq_node.left
      bfq.enqueue dq_node.right if dq_node.right
    end
    return str.chop
  end

  def print_preordered(node = @overall_root)
    str = "#{node.value}"
    str += " #{print_preordered(node.left)}" if node.left
    str += " #{print_preordered(node.right)}" if node.right
    return str
  end

  def print_postordered(node = @overall_root)
    str = "#{print_preordered(node.right)}" if node.right
    str += " #{print_preordered(node.left)}" if node.left
    str += " #{node.value}"
    return str
  end

  def print_in_ordered(node = @overall_root)
    str = "#{print_preordered(node.left)}" if node.left
    str += " #{node.value}"
    str += " #{print_preordered(node.right)}" if node.right
    return str
  end

  def load_bst_testing(a)
    middle_index = a.length / 2
    if a.length > 0
      insert(a[middle_index])
    end
    if a.length > 1
      l_size = middle_index
      r_size = a.length - l_size - 1
      left = a.slice(0, l_size)
      right = a.slice(l_size + 1, r_size)
      load_bst(left)
      load_bst(right)
    end
  end

private
  # recursive helper method(s)
  def subtree_count(node)
    return 0 unless node
    sl = node.left ? subtree_count(node.left) : 0
    sr = node.right ? subtree_count(node.right) : 0
    return 1 + sl + sr
  end

  def subtree_add(node, val)
    return BtNode.new(val) unless node
    if val < node.value
      node.left = subtree_add(node.left, val)
    elsif val > node.value
      node.right = subtree_add(node.right, val)
    end
    return node
  end
end
