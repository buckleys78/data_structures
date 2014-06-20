require 'test_helper'
require 'doubly_linked_list'
require 'benchmark'

describe DoublyLinkedList, "Testing Doubly Linked list" do
  before do
    @doubly_linked_list = DoublyLinkedList.new
  end

  it "will return nil if there are no nodes" do
    @doubly_linked_list.search(5).must_equal nil
  end

  it "will return the size of an empty list" do
    @doubly_linked_list.size == 0
  end

  it "will return the size of a list with elements" do
    @doubly_linked_list.add(5)
    @doubly_linked_list.add(3)
    @doubly_linked_list.add(4)
    @doubly_linked_list.size.must_equal 3
  end

  it "will remove a node in the middle" do
    @doubly_linked_list.add(5)
    @doubly_linked_list.add(4)
    @doubly_linked_list.add(3)
    @doubly_linked_list.remove(@doubly_linked_list.search(4))
    @doubly_linked_list.search(4).must_equal nil
    @doubly_linked_list.add(4)
  end

  it "can quickly remove all duplicates from a list of 200 random numbers" do
    200.times { @doubly_linked_list.add(rand(100)) }
    # puts @doubly_linked_list.size
    @doubly_linked_list.remove_duplicates_fast
    # puts @doubly_linked_list.size
    @doubly_linked_list.remove_duplicates_fast.must_equal 0
  end

  it "can thinly remove all duplicates from a list of 200 random numbers" do
    200.times { @doubly_linked_list.add(rand(100)) }
    # puts @doubly_linked_list.size
    @doubly_linked_list.remove_duplicates_thin
    # puts @doubly_linked_list.size
    @doubly_linked_list.remove_duplicates_thin.must_equal 0
  end

  it "will only contain non-duplicates after calling remove_duplicates_fast" do
    @doubly_linked_list.add(5)
    @doubly_linked_list.add(5)
    @doubly_linked_list.add(4)
    @doubly_linked_list.add(4)
    @doubly_linked_list.add(3)
    @doubly_linked_list.add(3)
    @doubly_linked_list.add(2)
    @doubly_linked_list.add(2)
    @doubly_linked_list.add(1)
    @doubly_linked_list.add(1)

    @doubly_linked_list.to_s.must_equal '5, 5, 4, 4, 3, 3, 2, 2, 1, 1'
    @doubly_linked_list.remove_duplicates_fast
    @doubly_linked_list.to_s.must_equal '5, 4, 3, 2, 1'

  end

  it "will only contain non-duplicates after calling remove_duplicates_thin" do
    @doubly_linked_list.add(5)
    @doubly_linked_list.add(5)
    @doubly_linked_list.add(4)
    @doubly_linked_list.add(4)
    @doubly_linked_list.add(3)
    @doubly_linked_list.add(3)
    @doubly_linked_list.add(2)
    @doubly_linked_list.add(2)
    @doubly_linked_list.add(1)
    @doubly_linked_list.add(1)

    @doubly_linked_list.to_s.must_equal '5, 5, 4, 4, 3, 3, 2, 2, 1, 1'
    @doubly_linked_list.remove_duplicates_thin
    @doubly_linked_list.to_s.must_equal '5, 4, 3, 2, 1'

  end

  @doubly_linked_list = DoublyLinkedList.new
  200.times { @doubly_linked_list.add(rand(100)) }
  puts "fast dedup: #{Benchmark.measure {@doubly_linked_list.remove_duplicates_fast}}"
  @doubly_linked_list = DoublyLinkedList.new
  200.times { @doubly_linked_list.add(rand(100)) }
  puts "thin dedup: #{Benchmark.measure {@doubly_linked_list.remove_duplicates_thin}}"

end
