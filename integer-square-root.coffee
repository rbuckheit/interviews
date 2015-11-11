{assert_equal} = require './_assert'

#
# Define a function which returns the integer square root of its input.
# Author: rbuckheit
#

# invariants:
#   low  : low * low <= n
#   high : high * high > n
isqrt_helper = (n, low, high) ->
  mid = Math.floor((low + high) / 2)

  # perfect square
  if mid * mid is n
    return mid
  # whole range searched
  if high - low <= 1
    return low
  # midpoint too high
  else if mid * mid > n
    return isqrt_helper(n, low, mid)
  # midpoint too low
  else
    return isqrt_helper(n, mid, high)

isqrt = (n) ->
  return isqrt_helper(n, 0, n)

# unit tests
# ==========

assert_equal(0, isqrt(0))
assert_equal(1, isqrt(2))
assert_equal(2, isqrt(4))
assert_equal(5, isqrt(25))
assert_equal(5, isqrt(35))
assert_equal(8, isqrt(80))
assert_equal(9, isqrt(85))

