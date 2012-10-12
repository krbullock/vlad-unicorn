require 'vlad/unicorn_common'

namespace :vlad do
  ##
  # Unicorn app server

  set(:unicorn_rackup)  { "#{current_path}/config.ru" }

  desc "(Re)Start the app servers"
  remote_task :start_app, :roles => :app do
    Vlad::Unicorn.start(unicorn_rackup)
  end

  desc "Reload the app servers"
  remote_task :reload_app, :roles => :app do
    Vlad::Unicorn.reload(unicorn_rackup)
  end
end
