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
    def initialize(name, desc)
      desc ||= {}
      desc['methods'] ||= {}

      @name = name
      @methods = desc['methods'].each_pair.map{|k,v|
        Method.new(k, v)
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
    def initialize(name, desc)
      desc ||= {}
      desc['return'] ||= 'void'
      desc['params'] ||= {}
      desc['paramorder'] ||= []

      @name = name
      @return = desc['return']
    end
    def to_s
      "#{@return} #{@name}();"
    end
  end

end # module

puts '--- Parsed CHUY:' if $debug
chuy_top = YAML.load(ARGF)
#puts chuy_top.inspect
pp chuy_top if $debug

chuy_top["classes"].each_pair do |class_name, chuy_class|
  c = Chug::Class.new(class_name, chuy_class)
  puts "--- Chug representation:" if $debug
  pp c if $debug
  puts "--- C++ Underlayer:" if $debug
  puts c
end

