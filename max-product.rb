require './_assert.rb'

#
# Given an input list of integers, output the largest product of 3 numbers in the list.
# Author: rbuckheit
#

def max_product(list)
  sorted        = list.sort
  largest_three = sorted.last(3)
  smallest_two  = sorted.first(2)

  positive_product = largest_three.inject(:*)
  negative_product = smallest_two.inject(:*) * sorted.last

  return [positive_product, negative_product].max
end

assert_equal(3 * 4 * 5, max_product([1, 3, 4, 2, 5]))
assert_equal(9 * 9 * 5, max_product([-9, -9, 1, 2, 3, 5]))
