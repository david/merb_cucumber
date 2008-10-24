module Merb::Generators
  
  class CucumberGenerator < Generator
    
    desc <<-DESC
      Generates setup code for cucumber feature framework
    DESC
    
    def self.source_root
      File.join(File.dirname(__FILE__), 'cucumber', 'templates')
    end
    
    option :orm, :desc => 'Object-Relation Mapper to use (one of: none, activerecord, datamapper, sequel)'
    
    option :session_type, :default => :simple, :desc => 'Session type to use (one of: simple, webrat)'
    
    template(:env) { |t| t.source = t.destination = "features/env.rb" }
    template(:common_result_steps) { |t| t.source = t.destination = "features/steps/common_result_steps.rb" }
    
    template(:example_feature, :session_type => :webrat) do |t| 
      t.source = t.destination = "features/login.feature" 
    end
    
    template(:example_feature_steps, :session_type => :webrat) do |t| 
      t.source = t.destination = "features/steps/login_steps.rb"
    end
    
    template(:common_webrat, :session_type => :webrat) do |t| 
      t.source = t.destination = "features/steps/common_webrat.rb"
    end
    
    template(:cucumber, :after => :chmod) { |t| t.source = t.destination = "bin/cucumber" }
    
    def chmod(action)
      File.chmod(0755, action.destination)
    end
    
  end 
  
  add :cucumber, CucumberGenerator
  
end
