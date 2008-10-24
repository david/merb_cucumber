require 'webrat/merb/merb_session'
require File.join(File.dirname(__FILE__), 'base')

# We have to change the Webrat::Field implementation (Some Rails dependencies!)
module Webrat
  class Field
    
    def to_param
      return nil if disabled?
      value = @value.to_s.gsub('&', '%26')
      param_parser.query_parse("#{name}=#{value}")
    end
    
    def param_parser
      Merb::Request
    end
    
    def test_uploaded_file
      raise Merb::StatusCodes::NotImplemented.new
    end
    
  end
end

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
