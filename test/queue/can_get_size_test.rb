require 'test_helper'
require 'queue'

describe Queue, "Testing Queue" do

  before do
    @queue = Queue.new
  end

  it "will return the size of an empty queue" do
    @queue.size == 0
  end

  it "will return the size of a queue with elements" do
    @queue.enqueue(5)
    @queue.enqueue(5)
    @queue.size.must_equal 2
  end

  it "will return the expected size when enqueueing and dequeueing" do
    @queue.enqueue(5)
    @queue.size.must_equal 1
    @queue.dequeue
    @queue.size.must_equal 0
  end
end
