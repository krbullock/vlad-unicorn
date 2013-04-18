= vlad-unicorn

* http://bitbucket.org/krbullock/vlad-unicorn/

== DESCRIPTION:

Unicorn app server support for Vlad. Adds support for vlad:start_app and
vlad:stop_app using Unicorn[http://unicorn.bogomips.org/].

== FEATURES/PROBLEMS:

* Unicorn support for vlad:start_app and vlad:stop_app tasks.

== SYNOPSIS:

    # lib/tasks/vlad.rake
    begin
      require 'vlad'
      Vlad.load(:app => :unicorn)
    rescue LoadError
    end

or for legacy Rails (1.2.x thru 2.2.x) apps

    # lib/tasks/vlad.rake
    begin
      require 'vlad'
      Vlad.load(:app => :unicorn_rails)
    rescue LoadError
    end

For more on specific issues when deploying Rails applications, see
rails-configuration.txt[link:docs/rails-configuration_txt.html].

== REQUIREMENTS:

* Vlad[http://rubyhitsquad.com/Vlad_the_Deployer.html]

* Unicorn[http://unicorn.bogomips.org/]

== INSTALL:

    $ sudo gem install vlad-unicorn

== VARIABLES:

unicorn_command::       Defaults to 'unicorn' when using
                        <tt>:app => :unicorn</tt>, and 'unicorn_rails' with
                        <tt>:app => :unicorn_rails.</tt>
unicorn_config::        The location of the Unicorn config file. Defaults to
                        "#{current_path}/config/unicorn.rb".
unicorn_pid::           The location of the Unicorn pid file. Must be the same
                        as in unicorn.rb file. Currently needed for the
                        +stop_app+ task, but hopefully won't be necessary in a
                        future version.
unicorn_rackup::        The location of the rackup file unicorn should load.
                        Defaults to "#{current_path}/config.ru". Not set nor
                        used for +unicorn_rails+.
unicorn_use_sudo::      Whether to use sudo to run the 'unicorn' command on
                        the remote host. Probably necessary if you specify a
                        user and group in unicorn.rb.
unicorn_env::           Environment to be given to unicorn (value for +-E+).
                        Default value is based on +vlad/rails+'s +rails_env+.
                        If +rails_env+ is not defined, +production+ is used as
                        default value. To disable passing an environment, set to
                        +nil+.
unicorn_use_bundler::   Whether to use <tt>bundle exec</tt> to run the 'unicorn'
                        command on the remote host. Defaults to false.
unicorn_bundle_cmd::    How to invoke <tt>bundle exec</tt>. Defaults to
                        <tt>cd #{current_path} && bundle exec</tt>. If you have
                        defined +bundle_cmd+ for Bundler's built-in deployment
                        tasks, vlad-unicorn will use that in place of +bundle+
                        in the above default.

For more on specific issues when deploying Rails applications, see
rails-configuration.txt[link:docs/rails-configuration_txt.html].

== TASKS:

start_app, stop_app::   Vlad's built-in tasks to start and stop the application
                        processes, adapted for Unicorn.

reload_app::            Reload unicorn (in case <tt>preload_app == true</tt>).
                        If this is the case, you have to adapt your +before_fork+
                        hook so it kills the old unicorn master and workers.
                        Cf. "Getting started with unicorn"[http://codelevy.com/2010/02/09/getting-started-with-unicorn.html].

== LICENSE:

(The MIT License)

Copyright (c) 2012 Kevin Bullock and the rest of the Ruby Hit Squad

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
