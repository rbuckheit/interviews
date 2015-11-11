require './_assert.rb'

#
# Return all duplicates in a set of numbers.
# Author: rbuckheit
#

def find_duplicates(list)
  frequencies = list.group_by{|num| num}
  return frequencies.select{ |num, instances| instances.length > 1 }.keys
end

# unit tests
# ==========

assert_equal([1,2], find_duplicates([1,2,3,4,5,6,1,2]))
assert_equal([], find_duplicates([3,4,5,6,1,2]))
assert_equal([5], find_duplicates([1,2,3,4,5,5,5,5,5,6]))

