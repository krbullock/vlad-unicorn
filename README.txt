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

For more on specific issues when deploying Rails applications, see
rails-configuration.txt[link:docs/rails-configuration_txt.html].

== LICENSE:

(The MIT License)

Copyright (c) 2010 Kevin Bullock and the rest of the Ruby Hit Squad

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
