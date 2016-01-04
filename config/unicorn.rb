root = "/Users/domster83/projects/nestegg"
working_directory root
pid "#{root}/tmp/pids/unicorn.pid"
stderr_path "#{root}/log/nestegg.log"
stdout_path "#{root}/log/nestegg.log"

listen "/tmp/unicorn.nestegg.sock"
worker_processes 2
timeout 30
