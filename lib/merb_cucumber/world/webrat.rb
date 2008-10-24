require 'webrat/merb/merb_session'
require File.join(File.dirname(__FILE__), 'base')

module Merb
  module Test
    module World
      class Webrat < ::Webrat::MerbSession
        include Base
      end
    end
  end
end

World do
  Merb::Test::World::Webrat.new
end
