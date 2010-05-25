require 'vlad/unicorn_common'

namespace :vlad do
  ##
  # Unicorn app server

  set :unicorn_command,     "unicorn"
  set :unicorn_environment, "production"
  set :unicorn_config,      "#{current_path}/config/unicorn.rb"
  set :unicorn_rackup,      "#{current_path}/config.ru"
  set :unicorn_use_sudo,    false

  desc "(Re)Start the app servers"
  remote_task :start_app, :roles => :app do
    Rake::Task['vlad:stop_app'].invoke
    cmd = "#{unicorn_command} -D --config-file #{unicorn_config}"
    cmd << " --env #{unicorn_environment}"
    cmd << " #{unicorn_rackup}"
    Vlad::Unicorn.maybe_sudo cmd
  end

  desc "Stop the app servers"
  remote_task :stop_app, :roles => :app do
    cmd = "#{unicorn_command} -m #{current_path} -K all"
    Vlad::Unicorn.maybe_sudo cmd
  end
end
