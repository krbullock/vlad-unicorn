require 'vlad/unicorn_common'

namespace :vlad do
  ##
  # Unicorn app server for legacy Rails apps

  set :unicorn_command, "unicorn_rails"

  desc "(Re)Start the app servers"
  remote_task :start_app, :roles => :app do
    Vlad::Unicorn.start
  end
end
