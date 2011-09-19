require 'psych'
require 'rake/clean'
require 'rubygems'
require 'rubygems/package_task'
require 'rspec/core/rake_task'
require 'cucumber'
require 'cucumber/rake/task'
require 'reek/rake/task'

spec = eval(File.read('workit.gemspec'))

Gem::PackageTask.new(spec) do |pkg|
end

Reek::Rake::Task.new do |t|
  t.fail_on_error = false
end

desc 'Default: run specs.'
task :default => :spec

desc "Run specs"
RSpec::Core::RakeTask.new do |t|
  t.pattern = "./spec/**/*_spec.rb" # don't need this, it's default.
  # Put spec opts in a file named .rspec in root
end

