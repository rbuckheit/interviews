#
# Given a list of numbers, compute the number of pairs having difference k.
# Author: rbuckheit
#

require 'set'
require './_assert.rb'

def count_pairs(numbers, k)
  set = Set.new(numbers)
  return numbers.select{|num| set.include?(num-k)}.count
end

# test cases
# ==========

assert_equal(2, count_pairs([1,2,3,5], 2))
assert_equal(0, count_pairs([1,2,3], 5))
assert_equal(3, count_pairs([1,2,3,4], 1))
