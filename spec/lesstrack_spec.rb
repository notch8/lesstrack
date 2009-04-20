require 'pp'
require File.join(File.dirname(__FILE__), %w[spec_helper])

describe Lesstrack do

  it "should have a method to load the punch.yml file" do
    lesstrack = Lesstrack.new
    lesstrack.punch.should_not be_nil
    lesstrack.punch.should be_instance_of Hash
  end

  it "should have a method for loading the lesstrack.yml file" do
    lesstrack = Lesstrack.new
    lesstrack.config.should_not be_nil
    lesstrack.config.should be_instance_of Hash
    lesstrack.config.keys.should include 'username'
    lesstrack.config.keys.should include 'password'
    lesstrack.config.keys.should include 'project_mapping'
  end

  
end

# EOF
