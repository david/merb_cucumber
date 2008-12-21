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
    
    template(:env) { |t| t.source = t.destination = "features/support/env.rb" }
    template(:rake) { |t| t.source = t.destination = "lib/tasks/cucumber.rake" }
    template(:autotest) { |t| t.source = t.destination = "autotest/cucumber_merb_rspec.rb" }
    template(:result_steps) { |t| t.source = t.destination = "features/steps/result_steps.rb" }
    
    template(:example_feature, :session_type => :webrat) { |t|  t.source = t.destination = "features/authentication/login.feature" }
    template(:example_feature_steps, :session_type => :webrat) do |t| 
      t.source = t.destination = "features/authentication/steps/login_steps.rb"
    end
    template(:webrat_steps, :session_type => :webrat) do |t| 
      t.source = t.destination = "features/steps/webrat_steps.rb"
    end
    
    template(:cucumber, :after => :chmod) { |t| t.source = t.destination = "bin/cucumber" }
    template(:cucumber_yml) { |t| t.source = t.destination = "cucumber.yml" }
    
    def chmod(action)
      File.chmod(0755, action.destination)
    end
    
  end 
  
  add :cucumber, CucumberGenerator
end
