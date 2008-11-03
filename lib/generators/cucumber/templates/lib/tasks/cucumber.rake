require 'cucumber/rake/task'

unless Cucumber::Rake::Task.const_defined?('BINARY')
  Cucumber::Rake::Task::BINARY = Merb.root / 'bin' / 'cucumber'
end

Cucumber::Rake::Task.new(:features) do |t|
  t.cucumber_opts = "--format pretty"
end

namespace :merb_cucumber do 
  task :test_env do
    Merb.start_environment(:environment => "test", :adapter => 'runner')
  end
end

<% if orm == :datamapper %>
task :features => ['merb_cucumber:test_env', 'db:automigrate']
<% else %>
task :features => 'merb_cucumber:test_env'
<% end %>
