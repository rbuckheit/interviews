require './_assert.rb'

#
# Given an input string, reverse it without using additional memory
# Author: rbuckheit
#
def reverse_inplace(str)
  (0..(str.length/2)-1).each do |i|
    str[i], str[-i-1] = str[-i-1], str[i]
  end
  return str
end


# unit tests
# ==========
assert_equal('abc'.reverse, reverse_inplace('abc'))
assert_equal('ab'.reverse, reverse_inplace('ab'))
