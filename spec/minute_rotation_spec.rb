require "spec_helper"
require "clock_time"
require 'minute_rotation'

describe "diff_hours" do
  it "should correctly diff hours if time1 < time2" do
    time1 = ClockTime.new "08:30 AM"
    time2 = ClockTime.new "10:30 PM"
    MinuteRotation.send(:diff_hour, time1, time2).should eq 14
  end

  it "should correctly diff hours if time1 > time2" do
    time1 = ClockTime.new "10:30 PM"
    time2 = ClockTime.new "08:30 PM"
    MinuteRotation.send(:diff_hour, time1, time2).should eq 22
  end

  it "should correctly diff hours if time1 = time2" do
    time1 = ClockTime.new "08:30 PM"
    time2 = ClockTime.new "08:30 PM"
    MinuteRotation.send(:diff_hour, time1, time2).should eq 0
  end
end

describe "diff_minutes" do
  it "should correctly diff minutes" do
    time1 = ClockTime.new "08:30 AM"
    time2 = ClockTime.new "10:15 PM"
    MinuteRotation.send(:diff_minute, time1, time2).should eq -15
  end
end

describe "diff_degrees" do
  it "should correctly resolve 10:30 AM, 01:45 PM" do
    MinuteRotation.diff_degrees("10:30 AM", "01:45 PM").should eq 1170
  end

  it "should correctly resolve 10:15 AM, 12:45 PM" do
    MinuteRotation.diff_degrees("10:15 AM", "12:45 PM").should eq 900
  end

  it "should correctly resolve 10:00 PM, 09:00 PM" do
    MinuteRotation.diff_degrees("10:00 PM", "09:00 PM").should eq 8280
  end

  it "should correctly resolve 11:45 PM, 08:15 PM" do
    MinuteRotation.diff_degrees("11:45 PM", "08:15 PM").should eq 7380
  end

  it "should correctly resolve 01:15 AM, 08:30 PM" do
    MinuteRotation.diff_degrees("01:15 AM", "08:30 PM").should eq 6930
  end

  it "should correctly resolve 10:15 PM, 10:15 PM" do
    MinuteRotation.diff_degrees("10:15 PM", "10:15 PM").should eq 0
  end

  it "should correctly resolve 10:15 PM, 10:16 PM" do
    MinuteRotation.diff_degrees("10:15 PM", "10:16 PM").should eq 6
  end

  it "should correctly resolve 10:16 PM, 10:15 PM" do
    MinuteRotation.diff_degrees("10:16 PM", "10:15 PM").should eq 8634
  end

end
