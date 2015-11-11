require 'set'
require './_assert.rb'

#
# Write a function that determines if there is a duplicate in a list of numbers.
# Author: rbuckheit
#

def contains_duplicate(arr)
  return Set.new(arr).size < arr.size
end

# unit tests
# ==========
assert_equal(true, contains_duplicate([1,2,3,2]))
assert_equal(false, contains_duplicate([1,2,3,4]))
