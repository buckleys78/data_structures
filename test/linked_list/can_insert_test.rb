require 'test_helper'
require 'linked_list'

describe LinkedList, "Testing Linked list" do

  before do
    @linked_list = LinkedList.new
  end

  it "will return an inserted value at the head" do
    @linked_list.insert_head(5)
    @linked_list.head.value.must_equal 5
  end
end
