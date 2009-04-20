# Look in the tasks/setup.rb file for the various options that can be
# configured in this Rakefile. The .rake files in the tasks directory
# are where the options are used.

begin
  require 'bones'
  Bones.setup
rescue LoadError
  begin
    load 'tasks/setup.rb'
  rescue LoadError
    raise RuntimeError, '### please install the "bones" gem ###'
  end
end

ensure_in_path 'lib'
require 'lesstrack'

task :default => 'spec:run'

PROJ.name = 'lesstrack'
PROJ.authors = 'Rob Kaufman'
PROJ.email = 'rob@notch8.com'
PROJ.url = 'github.com/notch8'
PROJ.version = Lesstrack::VERSION
PROJ.rubyforge.name = 'lesstrack'

PROJ.spec.opts << '--color'

# EOF
