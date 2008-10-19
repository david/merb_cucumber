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
