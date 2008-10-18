module Merb::Generators
  class CucumberGenerator < Generator
    
    desc <<-DESC
      Generates setup code for cucumber feature framework
    DESC
    
    
    def self.source_root
      File.join(File.dirname(__FILE__), 'cucumber', 'templates')
    end
    
    template(:env) { |t| t.source = t.destination = "features/env.rb" }
    # Webrat is not well supported (yet)
    #template(:common_webrat) { |t| t.source = t.destination = "features/steps/common_webrat.rb" }
    template(:cucumber, :after => :chmod) { |t| t.source = t.destination = "bin/cucumber" }
    
    def chmod(action)
      File.chmod(0755, action.destination)
    end
  end 
  
  add :cucumber, CucumberGenerator
end
