require 'webrat/rack/rack_session'
require File.join(File.dirname(__FILE__), 'base')

module Merb
  module Test
    module World
      class Webrat < Webrat::RackSession
        include Base
        
        attr_reader :response

        %w(get head post put delete).each do |verb|
          define_method(verb) do |*args| # (path, data, headers = nil)
            path, data, headers = *args
            all = (headers || {})
            all.merge!(:method => "#{verb.upcase}") unless all[:method] || all["REQUEST_METHOD"]
            
            unless data.empty?
              if verb == "post"
                all.merge!(:body_params => data)
              elsif verb == "get"
                all.merge!(:params => data)
              end
            end

            @response = request(path, all)
            
            class << @response
              def body
                super.to_s
              end
            end
            
            @response
          end
        end
      end
    end
  end
end

World do
  Merb::Test::World::Webrat.new
end
