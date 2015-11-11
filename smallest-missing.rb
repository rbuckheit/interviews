require 'set'
require './_assert.rb'

#
# Given an input list, return the first consecutive integer missing from this list,
# starting from 1.
#
# Author: rbuckheit
#

def smallest_missing(list)
  list_set = Set.new(list)
  tail_elt = 1
  until (!list_set.include?(tail_elt))
     tail_elt += 1
  end
  return tail_elt
end

# unit tests
# ==========

assert_equal 4, smallest_missing([1,2,3])
assert_equal 1, smallest_missing([])
assert_equal 1, smallest_missing([2,3,4])
assert_equal 2, smallest_missing([1,3,4])
