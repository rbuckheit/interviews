require './_assert.rb'

#
# Given a target string (word) and a list of strings (dictionary),
# return all anagrams of word which appear in the dictionary.
#
# Author: rbuckheit
#
def find_anagrams(word, dictionary)
  sort_chars = lambda{ |x| x.chars.sort.join }
  anagrams = Hash.new{|h,k| h[k] = [] }
  dictionary.each do |w|
    anagrams[sort_chars.call(w)] << w
  end
  return anagrams[sort_chars.call(word)]
end


# unit tests
# ==========
assert_equal(['foo', 'ofo'], find_anagrams('foo', ['foo','bar','ofo','baz']))
