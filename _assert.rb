#
# Helpers for basic assertions.
#

CHECK = '✓'

class AssertionFailedException < Exception; end

def green(string)
  return "\033[1m\033[32m#{string}\033[0m\033[22m"
end

def assert_equal(expected, actual, message = '')
  unless expected == actual
    raise AssertionFailedException.new( "expected #{expected} but got #{actual}" )
  else
    puts "#{green(CHECK)} test passed: #{expected} == #{actual} #{message}"
  end
end
