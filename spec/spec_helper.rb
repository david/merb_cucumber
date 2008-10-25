$:.push File.join(File.dirname(__FILE__), '..', 'lib')

require 'rubygems'
require 'spec'
require 'merb-core'
require 'ruby-debug'
require 'merb-gen'
require 'generators/cucumber'
require 'templater/spec/helpers'

Merb.disable(:initfile)

Spec::Runner.configure do |config|
  config.include Templater::Spec::Helpers
end


