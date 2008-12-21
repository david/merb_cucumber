require File.dirname(__FILE__) + '/spec_helper'
require File.join(File.dirname(__FILE__), '..', 'lib', 'generators', 'cucumber')

describe "common files generator", :shared => true do

  it "should generate the features/support/env.rb file" do
    @generator.should create('/tmp/features/support/env.rb')
  end

  it "should generate the cucumber.yml file" do
    @generator.should create('/tmp/cucumber.yml')
  end

  it "should generate the bin/cucumber file" do
    @generator.should create('/tmp/bin/cucumber')
  end

  it "should generate the autotest/cucumber_merb_rspec.rb file" do
    @generator.should create('/tmp/autotest/cucumber_merb_rspec.rb')
  end

  it "should generate the features/steps/result_steps.rb file" do
    @generator.should create('/tmp/features/steps/result_steps.rb')
  end
  
  it "should generate the lib/tasks/cucumber.rake" do
    @generator.should create('/tmp/lib/tasks/cucumber.rake')
  end
  
  it "should render templates successfully" do
    @generator.render!
  end
  
  
end

describe Merb::Generators::CucumberGenerator do 
  
  describe "with datamapper as the orm" do
    
    before(:each) do
      @generator = Merb::Generators::CucumberGenerator.new('/tmp', {:orm => :datamapper })
    end
    
    it_should_behave_like "common files generator"
    
    it "should have a requirement to the datamapper helper" do
      @generator.render!
    end
    
  end
  
  describe "with activerecord as the orm" do

    before(:each) do
      @generator = Merb::Generators::CucumberGenerator.new('/tmp', {:orm => :activerecord})
    end
    
    it_should_behave_like "common files generator"
    
    it "should have a requirement to the activerecord helper" do
      @generator.render!
    end
    
  end
  
  describe "on simple session" do

    before(:each) do
      @generator = Merb::Generators::CucumberGenerator.new('/tmp', {:orm => :datamapper})
    end

    it_should_behave_like "common files generator"

    it "should not generate the features/authentication/login.feature file" do
      @generator.should_not create('/tmp/features/authentication/login.feature')
    end

    it "should not generate the features/authentication/steps/login_steps.rb file" do
      @generator.should_not create('/tmp/features/authentication/steps/login_steps.rb')
    end

    it "should not generate the features/steps/webrat_steps.rb file" do
      @generator.should_not create('/tmp/features/steps/webrat_steps.rb')
    end

    it "should have a requirement to the simple session type on the env.rb file"
    
  end

  describe "on webrat session" do

    before(:each) do
      @generator = Merb::Generators::CucumberGenerator.new('/tmp', {:orm => :datamapper, :session_type => :webrat})
    end

    it_should_behave_like "common files generator"

    it "should generate the features/authentication/login.feature file" do
      @generator.should create('/tmp/features/authentication/login.feature')
    end

    it "should generate the features/authentication/steps/login_steps.rb file" do
      @generator.should create('/tmp/features/authentication/steps/login_steps.rb')
    end

    it "should generate the features/steps/webrat_steps.rb file" do
      @generator.should create('/tmp/features/steps/webrat_steps.rb')
    end

    it "should have a requirement to the webrat session type on the env.rb file"
  end
end
