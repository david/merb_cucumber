$:.push File.join(File.dirname(__FILE__), '..', 'lib')

require 'rubygems'
require 'spec'
require 'merb-core'
require 'merb-gen'

require 'templater/spec/helpers'

__dir__ = File.dirname(__FILE__)
require File.join(__dir__, "..", "lib", "generators", "cucumber")
require File.join(__dir__, "..", "lib", "generators", "feature")
Merb.disable(:initfile)

Spec::Runner.configure do |config|
  config.include Templater::Spec::Helpers
end


