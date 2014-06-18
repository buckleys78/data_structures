require 'test_helper'
require 'radix_sort'
require "pry"
require "pry-nav"
require 'benchmark'
require 'ruby-prof'

describe RadixSort, "Testing Radix Sort" do

  before do
    @arry= []
  end

  it "returns an empty array if the array is empty" do
    sorted_arry = RadixSort.sort_it(@arry)
    sorted_arry.length.must_equal 0
  end

  it "returns the array if it has one element" do
    @arry << 5
    sorted_arry = RadixSort.sort_it(@arry)
    sorted_arry.length.must_equal 1
    sorted_arry[0].must_equal 5
  end

  # it "returns the array untouched if the array elements aren't sortable" do

  # end

  it "returns an unsorted array sorted from smallest to largest" do
    @arry << 3
    @arry << 5
    @arry << 0
    @arry << 777
    @arry << -1000
    @arry << 4
    @arry << 106
    sorted_arry = RadixSort.sort_it(@arry)
    sorted_arry[0].must_equal -1000
    sorted_arry[1].must_equal 0
    sorted_arry[2].must_equal 3
    sorted_arry[3].must_equal 4
    sorted_arry[4].must_equal 5
    sorted_arry[5].must_equal 106
    sorted_arry[6].must_equal 777
  end

  # random_arry, lo_to_hi, hi_to_lo = [], [], []
  # # lo_to_hi = (0..30_000)
  # f = 0
  # r = 30_000 - 1
  # 30_000.times do
  #   random_arry << rand(30_000)
  #   lo_to_hi << f
  #   f += 1
  #   hi_to_lo << r
  #   r -= 1
  # end

  # puts "Radix Sort"
  # # # RubyProf.start
  # puts "lo to hi: #{Benchmark.measure {RadixSort.sort_it lo_to_hi}}"
  # puts "hi to lo: #{Benchmark.measure {RadixSort.sort_it hi_to_lo}}"
  # puts "random:   #{Benchmark.measure {RadixSort.sort_it random_arry}}"
  # puts
  # result = RubyProf.stop
  # printer = RubyProf::FlatPrinter.new(result)
  # printer.print(STDOUT)
end
