require './_assert.rb'

#
# Write a function that is given a list of integers containing n total
# elements, where each element in the range [1, n-1] and one of those elements
# is duplicated. It should return the duplicate element.
#
# Author: rbuckheit
#
def find_duplicate(list)
  list.reduce(:+) - (1..list.size-1).reduce(:+)
end

# unit tests
assert_equal(2, find_duplicate([1,2,3,2]))
