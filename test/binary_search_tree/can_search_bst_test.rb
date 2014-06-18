require 'test_helper'
require 'binary_search_tree'
require 'benchmark'
require 'pry'

describe BinarySearchTree, "Testing Binary Search Tree" do
  before do
    @bst = BinarySearchTree.new
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
    @bst.insert(59)
    @bst.contains('apple').must_equal true
    @bst.contains(59).must_equal true
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
    @bst.insert(4)
    @bst.insert(3)
    @bst.insert(2)
    @bst.balance.must_equal 3
  end

end
