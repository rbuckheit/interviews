require './_assert.rb'

#
# Given an input list of numbers where all numbers but one are duplicated,
# return the element which does not have a duplicate.
# Author: rbuckheit
#
def find_singleton(list)
  list.inject{|x, y| x ^ y}
end

# unit tests
# ==========
assert_equal(2,   find_singleton([1,1,3,3,5,5,2]))
assert_equal(127, find_singleton([44,65,23,44,127,23,65]))
assert_equal(55,  find_singleton([11,22,33,44,11,22,33,55,44]))
assert_equal(99,  find_singleton([99,23,-99,0,-99,23]))
