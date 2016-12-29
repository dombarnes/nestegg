source "https://rubygems.org"
ruby "2.3.3"

gem "rails", "~> 4.2.0"
gem "pg"
gem "puma", "~> 3.0"

gem "autoprefixer-rails"
gem 'bootstrap-sass'
gem 'coffee-rails', '~> 4.1.0'
# gem "delayed_job_active_record"
gem "email_validator"
gem "flutie"
gem "high_voltage"
gem "rails-i18n"
gem "i18n-tasks"
gem "jquery-rails"
gem "normalize-rails", "~> 3.0.0"
gem "rack-canonical-host"
gem "resque"
gem "resque-scheduler"
gem "refills"
gem "sass-rails", "~> 5.0"
gem "simple_form"
gem "title"
gem 'twitter-bootstrap-rails', github: 'seyhunak/twitter-bootstrap-rails'
gem 'uglifier', '>= 1.3.0'

gem "will_paginate"
gem "bootstrap-will_paginate"

# For importing
gem "smarter_csv", '~> 1.1.0'

group :development, :staging do
  gem "recipient_interceptor"
end

group :production do
  gem "newrelic_rpm", ">= 3.9.8"
end

group :development do
  gem "bullet"
  gem "capistrano", "~> 3.4"
  gem "capistrano-rails"
  gem "capistrano-bundler"
  gem 'capistrano-rbenv', '~> 2.0'
  gem "letter_opener"
  gem "spring"
  gem "spring-commands-rspec"
  gem "web-console"
end

group :development, :test do
  gem "awesome_print"
  gem "bundler-audit", require: false
  gem "byebug"
  gem "dotenv-rails"
  gem "factory_girl_rails"
  gem "pry-rails"
  gem "rspec-rails", "~> 3.3"
  gem "rubocop"
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

group :development, :staging do
  gem "rack-mini-profiler", require: false
end

group :staging, :production do
  gem "rails_stdout_logging"
  gem "rack-timeout"
end
