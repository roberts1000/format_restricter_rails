require "bundler/gem_tasks"
require "rspec/core/rake_task"

RSpec::Core::RakeTask.new(:spec)

task :default => :spec

task :console do
  exec "pry -r format_restricter_rails -I ./lib"
  #exec "irb -r format_restricter_rails -I ./lib"
end