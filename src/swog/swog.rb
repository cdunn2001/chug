#!/usr/bin/env ruby
=begin
   Initially, we dump only for Python.
=end

require 'yaml';
require 'pp'; # for pretty-printing

# chuy is the full nested hash.
# o is the output

$\ = "\n"
$debug = true

module Chug

  class Class
    def initialize(desc)
      desc['methods'] ||= {}

      @name = desc['name']
      @methods = desc['methods'].map{|desc|
        Method.new(desc)
      }
    end
    def to_s
      method_text = @methods.join("\n  ")
<<EOF
class #{@name}
{
  #{method_text}
};
EOF
    end
  end

  class Method
    def initialize(desc)
      desc['return'] ||= 'void'
      desc['params'] ||= {}

      @name = desc['name']
      @return = desc['return']
      @params = desc['params'].map{|desc|
        Param.new(desc)
      }
    end
    def to_s
      param_text = @params.join(", ")
      "#{@return} #{@name}(#{param_text});"
    end
  end

  class Param
    def initialize(desc)
      @name = desc['name']
      @type = desc['type']
    end
    def to_s
      "#{@type} #{@name}"
    end
  end
end # module

puts '--- Parsed CHUY:' if $debug
chuy_top = YAML.load(ARGF)
#puts chuy_top.inspect
pp chuy_top if $debug

chuy_top["classes"].each do |desc|
  c = Chug::Class.new(desc)
  puts "--- Chug representation:" if $debug
  pp c if $debug
  puts "--- C++ Underlayer:" if $debug
  puts c
end

