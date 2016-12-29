source 'https://rubygems.org'
ruby '2.3.3'

gem 'pg'
gem 'puma', '~> 3.0'
gem 'rails', '~> 4.2'

gem 'autoprefixer-rails'
gem 'bootstrap-sass'
gem 'coffee-rails', '~> 4.1'
# gem 'delayed_job_active_record'
gem 'email_validator'
gem 'flutie'
gem 'high_voltage'
gem 'i18n-tasks'
gem 'jquery-rails'
gem 'momentjs-rails', '~> 2.15', '>= 2.15.1'
gem 'normalize-rails', '~> 3.0'
gem 'rack-canonical-host'
gem 'rails_bootstrap_sortable', '~> 2.0', '>= 2.0.1'
gem 'rails-i18n'
gem 'refills'
gem 'resque'
gem 'resque-scheduler'
gem 'sass-rails', '~> 5.0'
gem 'simple_form'
gem 'title'
gem 'twitter-bootstrap-rails', git: 'https://github.com/seyhunak/twitter-bootstrap-rails'
gem 'uglifier', '>= 1.3.0'

gem 'bootstrap-will_paginate'
gem 'will_paginate'

# For importing
gem 'smarter_csv', '~> 1.1.0'

group :development, :staging do
  gem 'rack-mini-profiler', require: false
  gem 'recipient_interceptor'
end

group :production do
  gem 'newrelic_rpm', '>= 3.9.8'
end

group :development do
  gem 'bullet'
  gem 'capistrano', '~> 3.4'
  gem 'capistrano-bundler'
  gem 'capistrano-rails'
  gem 'capistrano-rbenv', '~> 2.0'
  gem 'letter_opener'
  gem 'spring'
  gem 'spring-commands-rspec'
  gem 'web-console'
end

group :development, :test do
  gem 'awesome_print'
  gem 'bundler-audit', require: false
  gem 'byebug'
  gem 'dotenv-rails'
  gem 'factory_girl_rails'
  gem 'pry-rails'
  gem 'rspec-rails'
  gem 'rubocop'
end

group :test do
  gem 'capybara-webkit', '>= 1.2.0'
  gem 'database_cleaner'
  gem 'formulaic'
  gem 'launchy'
  gem 'shoulda-matchers', require: false
  gem 'simplecov', require: false
  gem 'timecop'
  gem 'webmock'
end

group :staging, :production do
  gem 'rack-timeout'
  gem 'rails_stdout_logging'
end
