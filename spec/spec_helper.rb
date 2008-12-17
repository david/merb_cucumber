require 'rubygems'
require 'spec'
require 'merb-gen'

$:.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))

require 'templater/spec/helpers'

Merb.disable(:initfile)

Spec::Runner.configure do |config|
  config.include Templater::Spec::Helpers
end


