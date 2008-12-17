require File.dirname(__FILE__) + '/spec_helper'
require File.join(File.dirname(__FILE__), '..', 'lib', 'generators', 'feature')

def underscored_file_name(name)
  name.gsub(/\s+/, "_")
end


describe "feature generator", :shared => true do
  it "generates features/NAME.feature" do
    @generator.should create("/tmp/features/#{underscored_file_name(@name)}.feature")
  end
  
  it "renders templates successfully" do
    lambda { @generator.render! }.should_not raise_error
  end
end


describe Merb::Generators::CucumberFeatureGenerator, "#render!" do
  describe "with name includes spaces" do
    before(:each) do
      @name      = "account termination"
      @generator = Merb::Generators::CucumberFeatureGenerator.new('/tmp', {:steps => true}, @name)
    end

    it_should_behave_like "feature generator"
  end
  
  describe "with name includes spaces and underscores" do
    before(:each) do
      @name      = "how about some_snake_case"
      @generator = Merb::Generators::CucumberFeatureGenerator.new('/tmp', {:steps => true}, @name)
    end

    it_should_behave_like "feature generator"
  end

  describe "with --role='customer' given" do
    before(:each) do
      @name      = "account termination"
      @generator = Merb::Generators::CucumberFeatureGenerator.new('/tmp', {:role => "customer"}, @name)
    end

    it_should_behave_like "feature generator"

    it "uses given role in the story text"
  end

  describe "with --steps given" do
    before(:each) do
      @name      = "signup"
      @generator = Merb::Generators::CucumberFeatureGenerator.new('/tmp', {:steps => true}, @name)
    end

    it_should_behave_like "feature generator"

    it "generates steps file" do
      @generator.should create("/tmp/features/steps/#{underscored_file_name(@name)}_steps.rb")
    end
  end
end
