#!/usr/bin/env ruby
=begin
   Initially, we dump only for Python.
=end

require 'yaml';
require 'pp'; # for pretty-printing

puts 'Parsed CHUY:'
thing = YAML.load(ARGF)
#puts thing.inspect
pp thing
