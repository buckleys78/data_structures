require 'test_helper'
require 'binary_tree'

describe BinaryTree, "Testing Binary Tree" do

  before do
    peter = BinaryTree.new('Peter',nil,nil)
    andrea = BinaryTree.new('Andrea',nil,nil)
    katie = BinaryTree.new('Katie',peter,andrea)
    dan = BinaryTree.new('Dan',nil,nil)
    jony = BinaryTree.new('Jony',dan,katie)
    craig = BinaryTree.new('Craig',nil,nil)
    eddie = BinaryTree.new('Eddie',nil,nil)
    phil = BinaryTree.new('Phil',craig,eddie)
    @root = BinaryTree.new('Tim',jony,phil)
  end

  it "will return a list pre-ordered" do
    @root.print_pre_ordered.must_equal 'Tim Jony Dan Katie Peter Andrea Phil Craig Eddie'
  end

  it "will return a list post-ordered" do
    @root.print_post_ordered.must_equal 'Phil Craig Eddie Jony Dan Katie Peter Andrea Tim'
  end

  it "will return a list in-ordered" do
    @root.print_in_ordered.must_equal 'Jony Dan Katie Peter Andrea Tim Phil Craig Eddie'
  end

end
