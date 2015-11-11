require './_assert.rb'

#
# Given an input string, reverse it.
# Author: rbuckheit
#
def reverse(str)
  str.chars.inject([], &:unshift).join
end

# unit tests
# ==========
assert_equal('abc'.reverse, reverse('abc'))
assert_equal('ab'.reverse, reverse('ab'))
