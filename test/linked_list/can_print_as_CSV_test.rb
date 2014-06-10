require 'test_helper'
require 'linked_list'

describe LinkedList, "Testing Linked list" do
  before do
    @linked_list = LinkedList.new
  end

  it "will override to_s to print a CSV string" do
    @linked_list.insert_head(42)
    @linked_list.insert_head('tango')
    @linked_list.insert_head(:item)
    @linked_list.insert_head('sam')
    @linked_list.insert_head(12)
    @linked_list.to_s.must_equal "12, 'sam', :item, 'tango', 42"
  end
end
