module Merb
  module Test
    module World
      module Base
        include Merb::Test::ControllerHelper
        include Merb::Test::RouteHelper
        include Merb::Test::ViewHelper
        # Including the RequestMatchers (They are annonymous modules, so we have to do it the "hacker way!")
        Merb::Test::ExampleGroup.included_modules.each do |extension| 
          include extension if extension.name.empty?
        end
      end
    end
  end
end
