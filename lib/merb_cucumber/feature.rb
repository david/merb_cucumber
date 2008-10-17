module Merb::Test
  module DataMapperWorld
  end
  
  module ActiveRecordWorld
  end
  
  class MerbWorld
    include Merb::Test::ControllerHelper
    include Merb::Test::RouteHelper
    include Merb::Test::ViewHelper
    
    if defined?(DataMapper)
      include DataMapperWorld
    elsif defined?(ActiveRecord)
      include ActiveRecordWorld
    end
  end
end

World do
  MerbWorld.new
end
