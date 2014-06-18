require 'test_helper'
require 'hash_tbl'
require "pry"
require "pry-nav"

describe HashTbl, "Testing Hash Table" do

  before do
    @ht= HashTbl.new(17)
  end

  it "allows k,v pairs to be added to the hash table" do
    @ht.set('one', 1)
  end

  it "allows a k,v pair added, to be 'getted' " do
    @ht.set('one', 1)
    @ht.get('one').must_equal 1
  end

  it "raises a Runtime exeception if key is not a string" do
    err = ->{ @ht.set(1, 1) }.must_raise RuntimeError
    err.message.must_match /Key is not a String/
  end

  it "should return nil if get is called on empty hash" do
    @ht.get('one').must_equal nil
  end
end
