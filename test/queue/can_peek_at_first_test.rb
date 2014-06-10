require 'test_helper'
require 'queue'

describe Queue, "Testing Queue" do

  before do
    @queue = Queue.new
  end

  it "will raise a Runtime Error if peeking at an empty queue" do
    err = ->{ @queue.peek }.must_raise RuntimeError
    err.message.must_match /Queue is empty/
  end

  it "will return the value at the first of the queue without affecting the queue" do
    @queue.enqueue(5)
    @queue.enqueue(4)
    @queue.enqueue(3)
    @queue.size.must_equal 3
    @queue.peek.must_equal 5
    @queue.size.must_equal 3
  end

end
