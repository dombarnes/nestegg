web: bundle exec puma -p $PORT -C ./config/puma.rb
worker: bundle exec rake jobs:work
resque: bundle exec rake environment resque:work
