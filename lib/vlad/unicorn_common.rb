require 'vlad'

module Vlad
  module Unicorn
    VERSION = '2.0.0' #:nodoc:

    # Runs +cmd+ using sudo if the +:merb_use_sudo+ variable is set.
    def self.maybe_sudo(cmd)
      if merb_use_sudo
        sudo cmd
      else
        run cmd
      end
    end
  end
end

namespace :vlad do

  set :unicorn_command,     "unicorn"
  set :unicorn_environment, "production"
  set :unicorn_config,      "#{current_path}/config/unicorn.rb"
  set :unicorn_use_sudo,    false

end
