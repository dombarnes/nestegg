require 'resque/tasks'
require 'resque/scheduler/tasks'

namespace :resque do
  task :setup  => :environment do
  	require 'resque'	
  	ENV['QUEUE'] ||= '*'
  	
	  Resque.redis = 'localhost:6379' unless Rails.env == 'production'

	  #for redistogo on heroku http://stackoverflow.com/questions/2611747/rails-resque-workers-fail-with-pgerror-server-closed-the-connection-unexpectedl
	  Resque.before_fork = Proc.new do |job|
	    ActiveRecord::Base.connection.disconnect!
	  end
	  Resque.after_fork = Proc.new do |job|
	    ActiveRecord::Base.establish_connection
	  end
	end
end

desc "Alias for resque:work (To run workers on Heroku)"
task "jobs:work" => "resque:work"
