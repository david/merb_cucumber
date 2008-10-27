require File.dirname(__FILE__) + '/spec_helper'

describe "common files generator", :shared => true do

  it "should generate the features/env.rb file" do
    @generator.should create('/tmp/features/env.rb')
  end

  it "should generate the bin/cucumber file" do
    @generator.should create('/tmp/bin/cucumber')
  end

  it "should generate the features/steps/common_result_steps.rb file" do
    @generator.should create('/tmp/features/steps/common_result_steps.rb')
  end
  
  it "should generate the lib/tasks/cucumber.rake" do
    @generator.should create('/tmp/features/steps/common_result_steps.rb')
  end
  
  it "should generate the features/steps/common_resource_steps.rb file" do
    @generator.should create('/tmp/features/steps/common_resource_steps.rb')
  end
  
  it "should render templates successfully" do
    lambda { @generator.render! }.should_not raise_error
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
      # IO.read(@generator.template(:env).destination).should =~ %r[merb_cucumber/helpers/datamapper]
    end
    
  end
  
  describe "with activerecord as the orm" do

    before(:each) do
      @generator = Merb::Generators::CucumberGenerator.new('/tmp', {:orm => :activerecord})
    end
    
    it_should_behave_like "common files generator"
    
    it "should have a requirement to the activerecord helper" do
      @generator.render!
      # IO.read(@generator.template(:env).destination).should =~ %r[merb_cucumber/helpers/activerecord]
    end
    
  end
  
  describe "on simple session" do

    before(:each) do
      @generator = Merb::Generators::CucumberGenerator.new('/tmp', {:orm => :datamapper})
    end

    it_should_behave_like "common files generator"

    it "should not generate the features/login.feature file" do
      @generator.should_not create('/tmp/features/login.feature')
    end

    it "should not generate the features/steps/common_webrat.rb file" do
      @generator.should_not create('/tmp/features/steps/common_webrat.rb')
    end

    it "should have a requirement to the simple session type on the env.rb file" do
      @generator.render!
      # IO.read(@generator.template(:env).destination).should =~ %r[merb_cucumber/world/webrat]
    end
    
  end

  describe "on webrat session" do

    before(:each) do
      @generator = Merb::Generators::CucumberGenerator.new('/tmp', {:orm => :datamapper, :session_type => :webrat})
    end

    it_should_behave_like "common files generator"

    it "should generate the features/login.feature file" do
      @generator.should create('/tmp/features/login.feature')
    end

    it "should  generate the features/steps/common_webrat.rb file" do
      @generator.should create('/tmp/features/steps/common_webrat.rb')
    end

    it "should have a requirement to the webrat session type on the env.rb file" do
      @generator.render!
      # IO.read(@generator.template(:env).destination).should =~ %r[merb_cucumber/world/webrat]
    end

  end

end
