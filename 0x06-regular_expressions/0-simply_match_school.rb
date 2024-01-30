#!/usr/bin/env ruby

# Check if the script is provided with an argument
if ARGV.empty?
  puts "Usage: #{$PROGRAM_NAME} <string>"
  exit 1
end

# Input argument
input_string = ARGV[0]

# Regular expression to match "School"
regex = /School/

# Check if the input string matches the regular expression
if (match = input_string.match(regex))
  puts match[0] + '$'
else
  puts '$'
end
