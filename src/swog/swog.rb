#!/usr/bin/env ruby
=begin
=end

require 'pp'; # for pretty-printing
require 'yaml';

#$LOAD_PATH << "../../src"
#require 'chug';
require "#{File.dirname(__FILE__)}/../chug";

$\ = "\n"
$debug = true

module Chug

  class Class
    def swog
      method_text = @methods.map{|m| m.swog}.join("\n  ")
<<EOF
class #{@name}
{
  #{method_text}
};
EOF
    end
  end

  class Method
    def swog
      param_text = @params.map{|p| p.swog}.join(", ")
      "#{@return} #{@name}(#{param_text});"
    end
  end

  class Param
    def swog
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
  puts c.swog
end

