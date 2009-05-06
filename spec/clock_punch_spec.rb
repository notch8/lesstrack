require 'pp'
__DIR__ = File.dirname(__FILE__)
require File.join(__DIR__, %w[spec_helper])

describe ClockPunch do
  it "should read the clock_punches" do
    cp = ClockPunch.find(:first, :params => {:project_id => "2001"})
    cp.should_not be_nil
  end

end
