require 'test_helper'
require 'linked_list'

describe LinkedList, "Testing Linked list" do

  before do
    @linked_list = LinkedList.new
  end

  it "will return the size of an empty list" do
    @linked_list.size == 0
  end

  it "will return the size of a list with elements" do
    @linked_list.insert_head(5)
    @linked_list.insert_head(5)
    @linked_list.size.must_equal 2
  end
end
