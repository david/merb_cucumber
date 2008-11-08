module Merb
  module Test
    module World
      module Base
        include ::Merb::Test::Matchers
        include ::Merb::Test::ControllerHelper
        include ::Merb::Test::RouteHelper
        include ::Merb::Test::ViewHelper
      end
    end
  end
end
