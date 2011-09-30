require 'vlad'

module Vlad
  module Unicorn
    VERSION = '2.0.0' #:nodoc:

    # Runs +cmd+ using sudo if the +:unicorn_use_sudo+ variable is set.
    def self.maybe_sudo(cmd)
      if unicorn_use_sudo
        sudo cmd
      else
        run cmd
      end
    end
  end
end

namespace :vlad do

  set :unicorn_command,     "unicorn"
  set(:unicorn_config)      { "#{current_path}/config/unicorn.rb" }
  set :unicorn_use_sudo,    false
  set(:unicorn_pid)         { "#{shared_path}/pids/unicorn.pid" }

  def unicorn(opts = '')
    cmd = "#{unicorn_command} -D --config-file #{unicorn_config}"
    cmd << " #{opts}"
    cmd
  end

  desc "Stop the app servers"
  remote_task :stop_app, :roles => :app do
    cmd = []
    cmd << %(if [ -f "#{unicorn_pid}" ])
    cmd << %(then kill `cat #{unicorn_pid}` || echo "stale pid file #{unicorn_pid}")
    cmd << %(fi)
    Vlad::Unicorn.maybe_sudo %Q(sh -c '#{cmd.join("; ")}')
  end

end
