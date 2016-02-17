# config valid only for Capistrano 3.4
lock '3.4.0'

set :application, 'nestegg'
set :repo_url, 'git@github.com:dombarnes/nestegg.git'

# Default branch is :master
# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }.call

# Default deploy_to directory is /var/www/my_app
set :deploy_to, '/Users//apps/nestegg'

# Default value for :scm is :git
# set :scm, :git

# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
set :log_level, :info

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# set :linked_files, %w{config/database.yml}

# Default value for linked_dirs is []
# set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
set :keep_releases, 5


set :deploy_env, {
  'DATABASE_URL' => '',
  'LANG' => 'en_GB.UTF-8',
  'PATH' => 'bin:vendor/bundle/ruby/1.9.1/bin:/usr/local/bin:/usr/bin:/bin',
  'GEM_PATH' => 'vendor/bundle/ruby/1.9.1',
  'RACK_ENV' => 'production',
  
}
set :rails_env, 'production'

set :rbenv_type, :user
set :rbenv_ruby, File.read('.ruby-version').strip
set :rbenv_prefix, "RBENV_ROOT=#{fetch(:rbenv_path)} RBENV_VERSION=#{fetch(:rbenv_ruby)} /usr/local/bin/rbenv exec"
set :rbenv_map_bins, %w{rake gem bundle ruby rails}
set :rbenv_roles, :all # default value

namespace :deploy do

  # before :deploy do
  #   run("[[ ! -e #{fetch(:buildpack_path)} ]] && git clone #{fetch(:buildpack_url)} #{fetch(:buildpack_path)}; exit 0")
  #   run("cd #{fetch(:buildpack_path)} && git fetch origin && git reset --hard origin/master")
  #   run("mkdir -p #{shared_path}/build_cache")
  # end

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      # Your restart mechanism here, for example:
      # execute :touch, release_path.join('tmp/restart.txt')
      sudo "launchctl unload -wF #{launchd_conf_path}/#{application}-1.plist; true"
      sudo "foreman export launchd #{launchd_conf_path} -d #{release_path} -l /var/log/#{application} -a #{application} -u #{user} -p #{base_port} -c #{concurrency}"
      sudo "launchctl load -wF #{launchd_conf_path}/#{application}-1.plist; true"
    end
  end

  after :publishing, :restart

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

end
