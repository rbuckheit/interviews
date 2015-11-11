require './_assert.rb'

#
# Write a method which will iteratively process the nodes of a BST in-order.
# Author: rbuckheit
#

def inorder(root, processor=lambda{|x| puts x})
  stack   = []
  current = root

  while current or !stack.empty?
    if current
      stack.push(current)
      current = current.left
    else
      current = stack.pop()
      processor.call(current.val)
      current = current.right
    end
  end
end

# tests
# =====

class Node
  attr_accessor :left
  attr_accessor :right
  attr_accessor :val
  def initialize(left, right, val)
    @left  = left
    @right = right
    @val   = val
  end
end

lchild = Node.new(nil, nil, 1)
rchild = Node.new(nil, nil, 3)
parent = Node.new(lchild, rchild, 2)

collection = []
processor = lambda{|x| collection << x}
inorder(parent, processor)

assert_equal([1,2,3], collection)


