require './_assert'

#
# Parse and validate the correctness of a string containing bracket characters.
# Your solution should validate that every opening bracket is paired with a closing bracket.
# The following character sets should bet supported: {}, (), []
# Nesting is allowed, but you must validate the order of nested pairs.
# All non-bracket characters can be ignored.
#
# Author: rbuckheit
#

PAIRED_CHARACTERS = {
  :braces   => { :open => '{', :close => '}' },
  :parens   => { :open => '(', :close => ')' },
  :brackets => { :open => '[', :close => ']' }
}

OPENING_CHARACTERS = PAIRED_CHARACTERS.map {|type, charset| charset[:open]}
CLOSING_CHARACTERS = PAIRED_CHARACTERS.map {|type, charset| charset[:close]}

def closes_pair(open, close)
  return PAIRED_CHARACTERS.any? { |type, charset| charset[:open] == open and charset[:close] == close }
end

def parse(string)
  stack = []

  string.chars.each do |char|

    if OPENING_CHARACTERS.include?(char)
      stack.push(char)
    elsif CLOSING_CHARACTERS.include?(char)
      if closes_pair(stack.last, char)
        stack.pop()
      else
        return false
      end
    end

  end

  return stack.empty?
end

# unit tests
# ==========

# equivalence partitions:

# 1) valid strings (everything closed out, ordering correct)
assert_equal(parse('{()}'), true)
assert_equal(parse('[{()(){}}]'), true)

# 2) invalid - ordering incorrect
assert_equal(parse('{(})'), false)

# 3) invalid - missing closing character
assert_equal(parse('('), false)

# 4) invalid - open with a closing character
assert_equal(parse(')}()'), false)

# 5) no bracket characters (string is correct)
assert_equal(parse('abcd %^%'), true)

# 6) empty string - correct
assert_equal(parse(''), true)


