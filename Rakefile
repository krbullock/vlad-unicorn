# -*- ruby -*-

require 'rubygems'
require 'hoe'

Hoe.plugin :hg

Hoe.spec 'vlad-unicorn' do
  self.rubyforge_name = 'hitsquad'
  developer('Kevin R. Bullock', 'kbullock@ringworld.org')
  extra_deps << ['vlad', '~> 2.0']
  clean_globs << '.yardoc'
  self.hg_release_tag_prefix = 'v'
end

# vim: syntax=ruby
