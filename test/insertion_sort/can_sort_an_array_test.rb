require 'test_helper'
require 'insertion_sort'
require "pry"
require "pry-nav"
require 'benchmark'

describe InsertionSort, "Testing Insertion Sort" do

  before do
    @arry= []
  end

  it "returns an empty array if the array is empty" do
    sorted_arry = InsertionSort.sort_it(@arry)
    sorted_arry.length.must_equal 0
  end

  it "returns the array if it has one element" do
    @arry << 5
    sorted_arry = InsertionSort.sort_it(@arry)
    sorted_arry.length.must_equal 1
    sorted_arry[0].must_equal 5
  end

  it "returns the array untouched if the array elements aren't sortable" do

  end

  it "returns an unsorted array sorted from smallest to largest" do
    @arry << 3
    @arry << 5
    @arry << 2
    sorted_arry = InsertionSort.sort_it(@arry)
    sorted_arry[0].must_equal 2
    sorted_arry[1].must_equal 3
    sorted_arry[2].must_equal 5
  end

  random_arry, lo_to_hi, hi_to_lo = [], [], []
  f = 0
  r = 30_000 - 1
  30_000.times do
    random_arry << rand(30_000)
    lo_to_hi << f
    f += 1
    hi_to_lo << r
    r -= 1
  end

  puts Benchmark.measure {InsertionSort.sort_it lo_to_hi}
  puts Benchmark.measure {InsertionSort.sort_it hi_to_lo}
  puts Benchmark.measure {InsertionSort.sort_it random_arry}

end
