require 'test_helper'
require 'binary_search_tree'
require 'benchmark'
# require 'pry'

describe BinarySearchTree, "Testing Binary Search Tree" do
  before do
    @bst = BinarySearchTree.new
    @bst_full = BinarySearchTree.new
    [10, 7, 13, 6, 9, 11, 14].each { |v| @bst_full.insert(v) }

  end

  it "will return the size of an empty tree" do
    @bst.size.must_equal 0
  end

  it "returns false when an empty tree is searched for a value" do
    @bst.contains('apple').must_equal false
  end

  it "returns true when a tree with the value is searched for that value" do
    @bst.insert('apple')
    @bst.insert('pear')
    @bst.insert('59')
    @bst.contains('apple').must_equal true
    @bst.contains('59').must_equal true
  end

  it "has a depth method that returns the max number of levels" do
    @bst.insert(5)
    @bst.insert(4)
    @bst.insert(3)
    @bst.insert(2)
    @bst.depth.must_equal 4
  end

  it "has a balance method that returns the degree of tree imbalance" do
    @bst.insert(5)
    @bst.insert(6)
    @bst.insert(4)
    @bst.insert(3)
    @bst.insert(2)
    @bst.insert(1)
    @bst.balance.must_equal 3

  end

  it "can print the tree pre-ordered" do
    @bst_full.print_preordered.must_equal '10 7 6 9 13 11 14'
  end

  it "can print the tree post-ordered" do
    @bst_full.print_postordered.must_equal '13 11 14 7 6 9 10'
  end

  it "can print the tree in-ordered" do
    @bst_full.print_in_ordered.must_equal '7 6 9 10 13 11 14'
  end

  it "can print the tree breadth-first" do
    @bst_full.print_breadth_first.must_equal '10 7 13 6 9 11 14'
  end

  # @bst_slow = BinarySearchTree.new
  # @bst_full = BinarySearchTree.new
  # arry = []
  # (0..120000).each do |i|
  #   @bst_slow.insert(i)
  #   arry << i
  # end
  # @bst_full.load_bst(arry)

  # puts "worst case: #{Benchmark.measure {@bst_slow.contains(0)}}"
  # puts "full tree:  #{Benchmark.measure {@bst_full.contains(0)}}"

end


