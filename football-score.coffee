_                   = require 'lodash'
{assert_deep_equal} = require './_assert'

#
# Given an input consisting of a score for a football game,
# returns the set of possible numeric sequences of scoring
# events which could have made up that score.
#
# input  : 7
# return : [ [7],[2,2,3],[2,3,2],[3,2,2] ]
#

CACHE         = {}
INVALID_SCORE = undefined

ScoreType = {
  TOUCHDOWN : 7
  FIELDGOAL : 3
  SAFETY    : 2
}

decompose = (score) ->
  if CACHE[score]
    return CACHE[score]
  else if score is 0
    return [[]]
  else if score < 0
    return [[INVALID_SCORE]]
  else
    score_sets = _.chain(ScoreType)
      .values()
      .map((points) -> decompose(score - points).map((s)-> s.concat(points)))
      .flatten()
      .reject((s) -> s.indexOf(INVALID_SCORE) >= 0)
      .value()
    CACHE[score] = score_sets
    return score_sets


# unit tests
# ==========

assert_deep_equal(decompose(7), [ [7],[2,2,3],[2,3,2],[3,2,2] ])
assert_deep_equal(decompose(4), [ [2,2] ])
assert_deep_equal(decompose(3), [ [3] ])
