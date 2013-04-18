require 'vlad'

module Vlad
  module Unicorn
    VERSION = '2.3.1' #:nodoc:

    # Runs +cmd+ using sudo if the +:unicorn_use_sudo+ variable is set.
    def self.maybe_sudo(cmd)
      if unicorn_use_sudo
        sudo %(sh -c '#{cmd.gsub(/'/, "'\\''")}')
      else
        run cmd
      end
    end

    def self.start_unicorn(opts = '')
      cmd = %(#{unicorn_command} -D --config-file "#{unicorn_config}")
      cmd << %( -E "#{unicorn_env}") if unicorn_env
      cmd << %( #{opts}) if opts and !opts.empty?
      if unicorn_use_bundler
        [unicorn_bundle_cmd, cmd].join(' ')
      else
        cmd
      end
    end

    def self.signal(sig = '0')
      %(test -s "#{unicorn_pid}" && kill -#{sig} `cat "#{unicorn_pid}"`)
    end

    def self.start(opts = '')
      cmd = signal('HUP')
      cmd << %( || (#{start_unicorn(opts)}))
      maybe_sudo cmd
    end

    def self.reload(opts = '')
      cmd = signal('USR2')
      cmd << %( || (#{start_unicorn(opts)}))
      maybe_sudo cmd
    end

    def self.stop
      cmd = signal('QUIT')
      cmd << %( || echo "stale pid file #{unicorn_pid}")
      maybe_sudo cmd
    end
  end
end

namespace :vlad do
  set :unicorn_command,     "unicorn"
  set(:unicorn_config)      { "#{current_path}/config/unicorn.rb" }
  set :unicorn_use_sudo,    false
  set(:unicorn_pid)         { "#{shared_path}/pids/unicorn.pid" }
  set(:unicorn_env)         { Rake::RemoteTask.fetch(:rails_env, 'production') }
  set(:unicorn_bundle_cmd)  {
    "cd #{current_path} && #{Rake::RemoteTask.fetch(:bundle_cmd, 'bundle')} exec"
  }
  set :unicorn_use_bundler, false
  shared_paths['log'] ||= 'log'
  shared_paths['pids'] ||= 'tmp/pids'

  desc "Stop the app servers"
  remote_task :stop_app, :roles => :app do
    Vlad::Unicorn.stop
  end
end
