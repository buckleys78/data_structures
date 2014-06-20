require 'test_helper'
require 'queue'

describe Queue, "Testing Queue" do

  before do
    @queue = Queue.new
  end

  it "will raise a Runtime Error if dequeueing an empty queue" do
    err = ->{ @queue.dequeue }.must_raise RuntimeError
    err.message.must_match /Queue is empty/
  end

  it "will dequeue the same value enqueued to an empty queue" do
    @queue.enqueue(5)
    @queue.size.must_equal 1
    @queue.dequeue.must_equal 5
  end

  it 'will dequeue a set of queued values in the expected order' do
    @queue.enqueue(1)
    @queue.enqueue(2)
    @queue.enqueue(3)
    @queue.enqueue(4)
    @queue.enqueue(5)
    @queue.size.must_equal 5
    @queue.dequeue.must_equal 1
    @queue.dequeue.must_equal 2
    @queue.dequeue.must_equal 3
    @queue.dequeue.must_equal 4
    @queue.dequeue.must_equal 5
    @queue.size.must_equal 0
  end
end
