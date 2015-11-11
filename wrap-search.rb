require './_assert.rb'

#
# Given an input list of numbers which is sorted an possibly shifted,
# search for a particular target.
#
# Examples of shorted, shifted lists are:
#
# 1 2 3 4 5
# 5 6 1 2 3
# 3 4 5 6 1
#
# Author: rbuckheit
#

def wrap_search(list, target)
  if list.empty?
    return -1
  end

  mid_index   = list.length / 2
  mid         = list[mid_index]
  wraps_left  = list.first > mid
  wraps_right = list.last < mid

  if mid == target
    return mid_index
  end

  target_left = (wraps_left && target < mid or target > list.last) ||
     (wraps_right && target >= list.first && target < mid) ||
     (!wraps_right && !wraps_left && target < mid)

  if target_left
    return wrap_search(list.slice(0, mid_index), target)
  else
    return mid_index + 1 + wrap_search(list.slice(mid_index + 1, list.length), target)
  end
end

# unit tests
# ==========

# no wrap
assert_equal(0, wrap_search([1,2,3,4,5], 1))
assert_equal(2, wrap_search([1,2,3,4,5], 3))
assert_equal(4, wrap_search([1,2,3,4,5], 5))

# wrap left
assert_equal(0, wrap_search([5,6,1,2,3], 5))
assert_equal(3, wrap_search([5,6,1,2,3], 2))
assert_equal(2, wrap_search([5,6,1,2,3], 1))

# wrap right
assert_equal(4, wrap_search([3,4,5,6,1], 1))
assert_equal(0, wrap_search([3,4,5,6,1], 3))
assert_equal(2, wrap_search([3,4,5,6,1], 5))

