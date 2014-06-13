require 'test_helper'
require 'stack'
require "pry"
require "pry-nav"

describe Stack, "Testing Stack" do

  before do
    @stack= Stack.new
  end

  it "size will return 0 if the stack is empty" do
    @stack.size.must_equal 0
  end

  it "increases size by one when a value is pushed to the stack" do
    @stack.push(1)
    @stack.push(2)
    @stack.push(3)
    @stack.size.must_equal 3
  end

  it "returns nil if the stack is empty" do
    @stack.pop.must_equal nil
  end

  it "returns expected value based on push order" do
    @stack.push(1)
    @stack.push(2)
    @stack.push(3)
    @stack.pop.must_equal 3
    @stack.pop.must_equal 2
    @stack.pop.must_equal 1
    @stack.pop.must_equal nil
  end

end
