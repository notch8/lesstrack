# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{lesstrack}
  s.version = "1.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Rob Kaufman"]
  s.date = %q{2009-04-19}
  s.default_executable = %q{lesstrack}
  s.description = %q{lesstrack is simpler clone of freshtrack.  Basically it allows you to upload your punch record to LessTimeSpent.com}
  s.email = %q{rob@notch8.com}
  s.executables = ["lesstrack"]
  s.extra_rdoc_files = ["History.txt", "README.txt", "bin/lesstrack"]
  s.files = ["History.txt", "README.txt", "Rakefile", "bin/lesstrack", "lib/lesstrack.rb", "spec/lesstrack_spec.rb", "spec/spec_helper.rb", "tasks/ann.rake", "tasks/bones.rake", "tasks/gem.rake", "tasks/git.rake", "tasks/notes.rake", "tasks/post_load.rake", "tasks/rdoc.rake", "tasks/rubyforge.rake", "tasks/setup.rb", "tasks/spec.rake", "tasks/svn.rake", "tasks/test.rake", "tasks/zentest.rake"]
  s.has_rdoc = true
  s.homepage = %q{github.com/notch8}
  s.rdoc_options = ["--main", "README.txt"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{lesstrack}
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{lesstrack is simpler clone of freshtrack}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<bones>, [">= 2.5.0"])
    else
      s.add_dependency(%q<bones>, [">= 2.5.0"])
    end
  else
    s.add_dependency(%q<bones>, [">= 2.5.0"])
  end
end
