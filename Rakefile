# -*- ruby -*-

require 'rubygems'
require 'hoe'

Hoe.plugin :hg

spec = Hoe.spec 'vlad-unicorn' do
  self.rubyforge_name = 'hitsquad'
  developer('Kevin R. Bullock', 'kbullock@ringworld.org')
  extra_deps << ['vlad', '~> 2.0']
  clean_globs << '.yardoc'
  self.hg_release_tag_prefix = 'v'
  rdoc_locations <<
    "rubyforge.org:/var/www/gforge-projects/hitsquad/#{remote_rdoc_dir}"
end

task :gemspec do
  File.open 'vlad-unicorn.gemspec', 'w' do |f|
    f.write spec.spec.to_ruby
  end
end

# vim: syntax=ruby
