require './_assert.rb'

#
# Given an input row number i, output the ith row of Pascal's triangle.
#
# 0:    1
# 1:   1 1
# 2:  1 2 1
# 3: 1 3 3 1
#
# Author: rbuckheit
#

def pascal(i)
  if i == 0
    return [1]
  else
    row = [1,1]
    while row.length <= i
      sums = (0..row.length-2).map {|index| row[index] + row[index+1]}
      row = [1] + sums + [1]
    end
    return row
  end
end

# unit test
# =========

assert_equal([1], pascal(0))
assert_equal([1,1], pascal(1))
assert_equal([1,2,1], pascal(2))
assert_equal([1,3,3,1], pascal(3))
assert_equal([1,10,45,120,210,252,210,120,45,10,1], pascal(10))
