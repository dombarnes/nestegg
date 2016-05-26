# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically
# be available to Rake.

require File.expand_path('../config/application', __FILE__)

if %w(development test).include? Rails.env
  require 'rubocop/rake_task'
  RuboCop::RakeTask.new

  task(:default).clear
  task default: [:rubocop, :spec]
end

Rails.application.load_tasks
task(:default).clear
task default: [:spec]

if defined? RSpec
  task(:spec).clear
  RSpec::Core::RakeTask.new(:spec) do |t|
    t.verbose = false
  end
end

task default: 'bundler:audit'
