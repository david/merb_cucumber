$main = self # This must be included in the env.rb file!

module Merb
  module Test
    module Helpers
      module DataMapper
        
      end
    end
    
    module World
      module Base
        include Helpers::DataMapper
      end
    end
  end
end
