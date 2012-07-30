require 'yaml';
require 'pp'; # for pretty-printing

module Chug

  class Class
    def initialize(desc)
      desc['methods'] ||= {}

      @name = desc['name']
      @methods = desc['methods'].map{|desc|
        Method.new(desc)
      }
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
  end

  class Param
    def initialize(desc)
      @name = desc['name']
      @type = desc['type']
    end
  end

end # module

