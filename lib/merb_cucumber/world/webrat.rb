require 'webrat'
require 'webrat/merb'
require File.join(File.dirname(__FILE__), 'base')

module Merb
  module Test
    module World
      class Webrat < Webrat::Session
        include Base
      end
    end
  end
end

World do
  Merb::Test::World::Webrat.new
end
