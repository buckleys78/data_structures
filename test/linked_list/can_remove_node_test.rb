require 'test_helper'
require 'linked_list'

describe LinkedList, "Testing Linked list" do
  before do
    @linked_list = LinkedList.new
  end

  it "will return nil if there are no nodes" do
    @linked_list.search(5).must_equal nil
  end

  it "will remove a node in the middle" do
    @linked_list.insert_head(5)
    @linked_list.insert_head(4)
    @linked_list.insert_head(3)
    @linked_list.remove(@linked_list.search(4))
    @linked_list.search(4).must_equal nil
  end

  it "will remove the head node" do
    @linked_list.insert_head(5)
    @linked_list.insert_head(4)
    @linked_list.insert_head(3)
    @linked_list.remove(@linked_list.search(3))
    @linked_list.search(3).must_equal nil
  end

  it "will remove the tail node" do
    @linked_list.insert_head(5)
    @linked_list.insert_head(4)
    @linked_list.insert_head(3)
    @linked_list.remove(@linked_list.search(5))
    @linked_list.search(5).must_equal nil
  end


end
