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
