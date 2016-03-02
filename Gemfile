source "https://rubygems.org"

ruby "2.3.0"

gem "rails", "~> 4.2.0"
gem "pg"
gem "puma", "~> 2.15"
gem "delayed_job_active_record"
gem "resque"
gem "resque-scheduler"

gem "airbrake"
gem "autoprefixer-rails"
gem "bourbon", "~> 4.2.0"
gem "coffee-rails", "~> 4.1.0"
gem "email_validator"
gem "flutie"
gem "high_voltage"
gem "rails-i18n"
gem "i18n-tasks"
gem "jquery-rails"
gem "neat", "~> 1.7.0"
gem "newrelic_rpm", ">= 3.9.8"
gem "normalize-rails", "~> 3.0.0"
gem "rack-canonical-host"

gem "recipient_interceptor"
gem "refills"
gem "sass-rails", "~> 5.0"
gem "simple_form"
gem "title"
gem "uglifier"

gem "will_paginate"
gem "bootstrap-will_paginate"

# For importing
gem "ccsv", '~> 1.1.0'

group :development do
  gem "spring"
  gem "spring-commands-rspec"
  gem "web-console"
  gem "mail"
  gem "capistrano", "~> 3.4"
  gem "capistrano-rails"
  gem "capistrano-bundler"
  gem "capistrano-rbenv", '~> 2.0'
  gem "letter_opener"
end

group :development, :test do
  gem "awesome_print"
  gem "bundler-audit", require: false
  gem "byebug"
  gem "dotenv-rails"
  gem "factory_girl_rails"
  gem "pry-rails"
  gem "rspec-rails", "~> 3.3.0"
  gem 'rubocop'
end

group :test do
  gem "capybara-webkit", ">= 1.2.0"
  gem "database_cleaner"
  gem "formulaic"
  gem "launchy"
  gem "shoulda-matchers", require: false
  gem "simplecov", require: false
  gem "timecop"
  gem "webmock"
end

group :staging, :production do
  gem "rails_stdout_logging"
  gem "rack-timeout"
end
