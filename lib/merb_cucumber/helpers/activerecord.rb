$main = self # This must be included in the env.rb file!

module Merb
  module Test
    module Helpers
      module ActiveRecord
        
      end
    end
    
    module World
      module Base
        include Helpers::ActiveRecord
      end
    end
  end
end
