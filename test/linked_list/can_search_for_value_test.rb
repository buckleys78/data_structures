require 'test_helper'
require 'linked_list'

describe LinkedList, "Testing Linked list" do
  before do
    @linked_list = LinkedList.new
  end

  it "will return the node of a searched-for value" do
    @linked_list.insert_head(5)
    @linked_list.insert_head(4)
    @linked_list.insert_head(3)
    @linked_list.search(4).value.must_equal 4
  end

  it "will return nil if the value doesn't exist" do
    @linked_list.search(3) == nil
  end
end
