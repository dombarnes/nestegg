# Simple Role Syntax
# ==================
# Supports bulk-adding hosts to roles, the primary server in each group
# is considered to be the first unless any hosts have the primary
# property set.  Don't declare `role :all`, it's a meta role.

role :web, ""
# role :app, %w{deploy@example.com}

# Extended Server Syntax
# ======================
# This can be used to drop a more detailed server definition into the
# server list. The second argument is a, or duck-types, Hash and is
# used to set extended properties on the server.

server '', roles: %w{web app}

set :rails_env, "production"
set :deploy_via, :remote_cache
set :branch, "develop"

# set :base_port, 6500
# set :buildpack_url, "https://github.com/heroku/heroku-buildpack-ruby"
# set :buildpack_hash, Digest::SHA1.hexdigest(fetch(:buildpack_url))
# set :buildpack_path, "#{shared_path}/buildpack-#{fetch(:buildpack_hash)}"
# set :concurrency, "web=1"
# set :launchd_conf_path, "/Users/#{fetch(:user)}/Library/LaunchAgents"

# Custom SSH Options
# ==================
# You may pass any option but keep in mind that net/ssh understands a
# limited set of options, consult[net/ssh documentation](http://net-ssh.github.io/net-ssh/classes/Net/SSH.html#method-c-start).
#
# Global options
# --------------
 set :ssh_options, {
   user: "",
   port: 3322,
   auth_methods: %w(publickey),
   keys: %w(/Users//.ssh/id_dsa),
   forward_agent: true
   # verbose: :debug
 }
 
#
# And/or per server (overrides global)
# ------------------------------------
# server 'example.com',
#   user: 'user_name',
#   roles: %w{web app},
#   ssh_options: {
#     user: 'user_name', # overrides user setting above
#     keys: %w(/home/user_name/.ssh/id_rsa),
#     forward_agent: false,
#     auth_methods: %w(publickey password)
#     # password: 'please use keys'
#   }
