module Merb::Generators
  class CucumberFeatureGenerator < NamedGenerator
    
    desc <<-DESC
      Generates cucumber feature files
    DESC
    
    def self.source_root
      File.join(File.dirname(__FILE__), 'feature', 'templates')
    end

    def underscored_file_name(name)
      name.gsub(/\s+/, "_")
    end

    first_argument :name, :required => true

    option :goal, :desc => 'Goal used in the story: To [tighten the feedback loop, protect the revenue, ...]',
            :as => :string, :default => "[accomplish some goal]"
    option :role, :desc => 'Role used in the story: A [subscriber, account administrator, ...]',
            :as => :string, :default => "[role]"
    option :steps, :desc => "Also generate a steps file",
            :as => :boolean, :default => false
    
    template :feature do |t|
      t.source      = "feature.rbt"
      t.destination = "features/#{underscored_file_name(name)}.feature"
    end

    file :steps, :steps => true do |t|
      t.source      = "feature_steps.rb"
      t.destination = "features/steps/#{underscored_file_name(name)}_steps.rb"
    end
  end

  add :feature, CucumberFeatureGenerator  
end
