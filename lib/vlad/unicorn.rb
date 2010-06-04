require 'vlad/unicorn_common'

namespace :vlad do
  ##
  # Unicorn app server

  set(:unicorn_rackup)  { "#{current_path}/config.ru" }

  desc "(Re)Start the app servers"
  remote_task :start_app, :roles => :app do
    Rake::Task['vlad:stop_app'].invoke
    Vlad::Unicorn.maybe_sudo unicorn(unicorn_rackup)
  end
end
