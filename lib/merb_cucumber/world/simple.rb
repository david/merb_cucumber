require File.join(File.dirname(__FILE__), 'base')

module Merb
  module Test
    module World
      class Simple
        include Base
      end
    end
  end
end

World do
  Merb::Test::World::Simple.new
end
