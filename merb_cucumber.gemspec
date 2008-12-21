# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{merb_cucumber}
  s.version = "0.5.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Roman Gonzalez", "David Leal"]
  s.date = %q{2008-12-21}
  s.description = %q{Cucumber integration for Merb}
  s.email = ["romanandreg@gmail.com", "dgleal@gmail.com"]
  s.extra_rdoc_files = ["README.textile", "LICENSE", "TODO"]
  s.files = ["LICENSE", "README.textile", "Rakefile", "TODO", "Generators", "lib/merb_cucumber.rb", "lib/generators", "lib/generators/cucumber", "lib/generators/cucumber/templates", "lib/generators/cucumber/templates/features", "lib/generators/cucumber/templates/features/support", "lib/generators/cucumber/templates/features/support/env.rb", "lib/generators/cucumber/templates/features/authentication", "lib/generators/cucumber/templates/features/authentication/steps", "lib/generators/cucumber/templates/features/authentication/steps/login_steps.rb", "lib/generators/cucumber/templates/features/authentication/login.feature", "lib/generators/cucumber/templates/features/steps", "lib/generators/cucumber/templates/features/steps/webrat_steps.rb", "lib/generators/cucumber/templates/features/steps/result_steps.rb", "lib/generators/cucumber/templates/autotest", "lib/generators/cucumber/templates/autotest/cucumber_merb_rspec.rb", "lib/generators/cucumber/templates/cucumber.yml", "lib/generators/cucumber/templates/bin", "lib/generators/cucumber/templates/bin/cucumber", "lib/generators/cucumber/templates/lib", "lib/generators/cucumber/templates/lib/tasks", "lib/generators/cucumber/templates/lib/tasks/cucumber.rake", "lib/generators/feature", "lib/generators/feature/templates", "lib/generators/feature/templates/feature_steps.rb", "lib/generators/feature/templates/feature.rbt", "lib/generators/cucumber.rb", "lib/generators/feature.rb", "lib/merb_cucumber", "lib/merb_cucumber/world", "lib/merb_cucumber/world/base.rb", "lib/merb_cucumber/world/simple.rb", "lib/merb_cucumber/world/webrat.rb", "lib/merb_cucumber/helpers", "lib/merb_cucumber/helpers/activerecord.rb", "lib/merb_cucumber/helpers/datamapper.rb", "spec/spec_helper.rb", "spec/cucumber_setup_generator_spec.rb", "spec/feature_generator_spec.rb"]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/david/merb_cucumber}
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{merb}
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{Cucumber integration for Merb}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<merb-core>, ["~> 1.0.6.1"])
      s.add_runtime_dependency(%q<cucumber>, [">= 0.1.13"])
    else
      s.add_dependency(%q<merb-core>, ["~> 1.0.6.1"])
      s.add_dependency(%q<cucumber>, [">= 0.1.13"])
    end
  else
    s.add_dependency(%q<merb-core>, ["~> 1.0.6.1"])
    s.add_dependency(%q<cucumber>, [">= 0.1.13"])
  end
end
