{expect} = require 'chai'

green = (string) ->
  return '\x1b[32m' + string + '\x1b[0m'

CHECK = '✓'

assert_equal = (expected, actual) ->
  expect(expected).to.equal(actual)
  console.log(green(CHECK) + ' test passed', JSON.stringify {expected, actual})

assert_deep_equal = (expected, actual) ->
  expect(expected).to.deep.equal(actual)
  console.log(green(CHECK) + ' test passed', JSON.stringify {expected, actual})

module.exports = {
  assert_equal,
  assert_deep_equal
}
