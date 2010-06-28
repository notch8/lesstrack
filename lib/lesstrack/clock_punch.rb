require 'rubygems'
require 'activeresource'

unless defined?(USERNAME)
  config = YAML.load_file(File.join(ENV['HOME'], '.lesstrack.yml'))
  USERNAME = config['username']
end

unless defined?(PASSWORD)
  config = YAML.load_file(File.join(ENV['HOME'], '.lesstrack.yml'))
  PASSWORD = config['password']
end

class ClockPunch < ActiveResource::Base  
  self.site = "https://lesstimespent.com"
  self.user = USERNAME
  self.password = PASSWORD
  
end
