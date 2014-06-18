require 'bt_node'
require 'pry'

class BinarySearchTree
  include Comparable

  def initialize
    @size = 0
    @overall_root = nil
  end

  def empty?
    size == 0
  end

  def size
    @size
  end

  def insert(val)
    return false if contains(val)
    @overall_root = subtree_add(@overall_root, val)
    @size += 1
  end

  def contains(val)
    subtree_contains_pre_ordered(@overall_root, val)
  end

  def depth
    subtree_depth(@overall_root)
  end

  def balance
    return 0 if @size < 2
    lc = subtree_count(@overall_root.left)
    rc = subtree_count(@overall_root.right)
    return lc - rc
  end

private
  # recursive helper method(s)
  def subtree_count(node)
    if node.nil?
      return 0
    else
      sl = node.left ? subtree_count(node.left) : 0
      sr = node.right ? subtree_count(node.right) : 0
      return 1 + sl + sr
    end
  end

  def subtree_depth(node)
    if node.nil?
      return 0
    else
      dl = node.left ? subtree_depth(node.left) : 0
      dr = node.right ? subtree_depth(node.right) : 0
      return 1 + [dl, dr].max
    end
  end

  def subtree_add(node, val)
    if node.nil?
      node = BtNode.new(val)
    else
      comp = val.to_s <=> node.value.to_s
      if comp < 0
        node.left = subtree_add(node.left, val)
      elsif comp > 0
        node.right = subtree_add(node.right, val)
      end
    end
    return node
  end

  # def subtree_contains_in_ordered(node, val)

  # end

  def subtree_contains_pre_ordered(node, val)
    return false unless node

    comp = val.to_s <=> node.value.to_s
    if comp == 0
      return true
    elsif comp < 0
      subtree_contains_pre_ordered(node.left, val)
    else  #comp > 0
      subtree_contains_pre_ordered(node.right, val)
    end
  end

  # def subtree_contains_post_ordered(node, val)

  # end

  # def subtree_contains_breadth_first(node, val)

  # end


end
