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

  it "should return nil if the hash does not contain the key" do
    @ht.set('two', 2)
    @ht.get('one').must_equal nil
  end

  it "allows a k,v pair added, to be 'getted' " do
    @ht.set('one', 1)
    @ht.set('two', 2)
    @ht.set('three', 'tree')
    @ht.set('four', 4)
    @ht.set('five', 5)
    @ht.get('one').must_equal 1
    @ht.get('five').must_equal 5
    @ht.get('three').must_equal 'tree'
  end

  it "can find a k,v pair from a bucket with many collisions" do
    @ht.set('one', 1)
    @ht.set('two', 2)     #collision
    @ht.set('wto', 2.1)   #collision
    @ht.set('owt', 2.2)   #collision
    @ht.set('tow', 2.3)   #collision
    @ht.set('five', 5)
    @ht.get('one').must_equal 1
    @ht.get('two').must_equal 2
    @ht.get('owt').must_equal 2.2
    @ht.get('tow').must_equal 2.3
    @ht.get('five').must_equal 5
  end
end
