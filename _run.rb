#!/usr/bin/ruby

THIS_FILE          = __FILE__

HELPER_PATTERN     = './_'
INCOMPLETE_PATTERN = 'incomplete'

def find_files(extension)
  return `find . -name "*#{extension}"`.split("\n").reject{|s| s.start_with?(HELPER_PATTERN)}.reject{|s| s.include?(INCOMPLETE_PATTERN)}
end

def run_file(interpreter, file)
  puts "running #{file} ..."
  puts `#{interpreter} #{file}` + "\n"
  if $?.exitstatus != 0
    raise "Running file #{file} failed!"
  end
end

COFFEE_FILES = find_files('.coffee')
RUBY_FILES   = find_files('.rb')

RUBY_FILES.each {|file| run_file('ruby', file) }
COFFEE_FILES.each {|file| run_file('coffee', file) }
