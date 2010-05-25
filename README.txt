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

== REQUIREMENTS:

* Vlad[http://rubyhitsquad.com/Vlad_the_Deployer.html]

* Unicorn[http://unicorn.bogomips.org/]

== INSTALL:

    $ sudo gem install vlad-unicorn

== VARIABLES:

* FIX

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
