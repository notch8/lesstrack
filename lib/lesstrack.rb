require 'rubygems'
require 'yaml'
require 'restclient'
class Lesstrack

  def initialize
    @punch = nil
    @config = nil
  end
  
  # load the punch.yml file
  def punch(reload = false)
    if reload || @punch.nil?
      return @punch = YAML.load_file(File.join(ENV['HOME'], '.punch.yml'))
    else
      return @punch
    end
  end

  def config(reload = false)
    if reload || @config.nil?
      return @config = YAML.load_file(File.join(ENV['HOME'], '.lesstrack.yml'))
    else
      return @config
    end
  end

  def run
    config['project_mapping'].each do |key, project_id|
      punch[key].each do |punch_item|
        notes = punch_item["log"].clone
        notes.delete_if do |value| value.match(/^punch (in|out)/) end
        r = RestClient.post("https://#{config['username']}:#{config['password']}@lesstimespent.com/projects/#{project_id}/clock_punches.xml",
                            :clock_punch => {:starts_at => punch_item["in"],
                              :ends_at => punch_item["out"],
                              :note => notes.join('\n')} )
      end
    end
  end
  
  # load the config for project mapping
  # upload each time entry
  # offer to clear punch.yml (TBD)
  
  # :stopdoc:
  VERSION = '1.0.0'
  LIBPATH = ::File.expand_path(::File.dirname(__FILE__)) + ::File::SEPARATOR
  PATH = ::File.dirname(LIBPATH) + ::File::SEPARATOR
  # :startdoc:

  # Returns the version string for the library.
  #
  def self.version
    VERSION
  end

  # Returns the library path for the module. If any arguments are given,
  # they will be joined to the end of the libray path using
  # <tt>File.join</tt>.
  #
  def self.libpath( *args )
    args.empty? ? LIBPATH : ::File.join(LIBPATH, args.flatten)
  end

  # Returns the lpath for the module. If any arguments are given,
  # they will be joined to the end of the path using
  # <tt>File.join</tt>.
  #
  def self.path( *args )
    args.empty? ? PATH : ::File.join(PATH, args.flatten)
  end

  # Utility method used to require all files ending in .rb that lie in the
  # directory below this file that has the same name as the filename passed
  # in. Optionally, a specific _directory_ name can be passed in such that
  # the _filename_ does not have to be equivalent to the directory.
  #
  def self.require_all_libs_relative_to( fname, dir = nil )
    dir ||= ::File.basename(fname, '.*')
    search_me = ::File.expand_path(
        ::File.join(::File.dirname(fname), dir, '**', '*.rb'))

    Dir.glob(search_me).sort.each {|rb| require rb}
  end

end  # module Lesstrack

Lesstrack.require_all_libs_relative_to(__FILE__)

# EOF
