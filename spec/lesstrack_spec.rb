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

  it "should allow checking for repeats" do
    lesstrack = Lesstrack.new
    clock_punches = ClockPunch.find(:all, :params => {:project_id => "2001"})
    depot_punch = {"out"=>Time.parse("Fri May 01 12:00:00 -0700 2009"),
      "total"=>"03:00:00",
      "log"=>["punch in @ 2009-05-01T09:00:00-07:00",
              "punch out @ 2009-05-01T12:00:00-07:00"],
      "in"=>Time.parse("Fri May 01 09:00:00 -0700 2009")}
    lesstrack.repeat?(depot_punch, clock_punches).should_not be_true
    test_punch = {"out"=>Time.parse("2009-05-06T11:53:00-07:00"),
      "total"=>"02:53:17",
      "log"=>["punch in @ 2009-05-01T09:00:00-07:00",
              "punch out @ 2009-05-06T11:53:00-07:00"],
      "in"=>Time.parse("2009-05-06T09:00:00-07:00")}
    lesstrack.repeat?(test_punch, clock_punches).should be_true
    
  end

  
end

# EOF
