Gem::Specification.new do |s|
  s.name = %q{merb_cucumber}
  s.version = "0.2.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Roman Gonzalez", "David Leal"]
  s.date = %q{2008-10-26}
  s.description = %q{Cucumber integration for Merb}
  s.email = ["romanandreg@gmail.com", "dgleal@gmail.com"]
  s.extra_rdoc_files = ["README.textile", "LICENSE", "TODO"]
  s.files = ["LICENSE", "README.textile", "Rakefile", "TODO", "Generators", "lib/merb_cucumber.rb", "lib/generators", "lib/generators/cucumber", "lib/generators/cucumber/templates", "lib/generators/cucumber/templates/features", "lib/generators/cucumber/templates/features/steps", "lib/generators/cucumber/templates/features/steps/common_resource_steps.rb", "lib/generators/cucumber/templates/features/steps/common_webrat.rb", "lib/generators/cucumber/templates/features/steps/common_result_steps.rb", "lib/generators/cucumber/templates/features/steps/login_steps.rb", "lib/generators/cucumber/templates/features/env.rb", "lib/generators/cucumber/templates/features/login.feature", "lib/generators/cucumber/templates/bin", "lib/generators/cucumber/templates/bin/cucumber", "lib/generators/cucumber/templates/lib", "lib/generators/cucumber/templates/lib/tasks", "lib/generators/cucumber/templates/lib/tasks/cucumber.rake", "lib/generators/cucumber.rb", "lib/merb_cucumber", "lib/merb_cucumber/world", "lib/merb_cucumber/world/base.rb", "lib/merb_cucumber/world/simple.rb", "lib/merb_cucumber/world/webrat.rb", "lib/merb_cucumber/helpers", "lib/merb_cucumber/helpers/activerecord.rb", "lib/merb_cucumber/helpers/datamapper.rb", "spec/spec_helper.rb", "spec/cucumber_spec.rb"]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/david/merb_cucumber}
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{merb}
  s.rubygems_version = %q{1.2.0}
  s.summary = %q{Cucumber integration for Merb}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if current_version >= 3 then
      s.add_runtime_dependency(%q<merb>, [">= 0.9.9"])
      s.add_runtime_dependency(%q<cucumber>, [">= 0.1.7"])
    else
      s.add_dependency(%q<merb>, [">= 0.9.9"])
      s.add_dependency(%q<cucumber>, [">= 0.1.7"])
    end
  else
    s.add_dependency(%q<merb>, [">= 0.9.9"])
    s.add_dependency(%q<cucumber>, [">= 0.1.7"])
  end
end
