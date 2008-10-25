require File.join(File.dirname(__FILE__), "rake", "task")

Merb::Cucumber::Task.new

namespace :cucumber do 
  task :test_env do
    Merb.start_environment(:environment => "test", :adapter => 'runner')
  end
  task "features:all" => :test_env
  task :feature       => :test_env
  if Merb.orm == :datamapper
    task "features:all" => "db:automigrate"
    task :feature       => "db:automigrate"
  end
end
