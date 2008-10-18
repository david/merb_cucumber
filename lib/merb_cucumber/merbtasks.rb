require 'cucumber/rake/task'

Cucumber::Rake::Task::BINARY = Merb.root / 'bin' / 'cucumber' # dirty hack! 

Cucumber::Rake::Task.new(:features) do |t|
  t.cucumber_opts = "--format pretty"
end

if defined?(DataMapper)
  task :features => 'db:automigrate'
end
