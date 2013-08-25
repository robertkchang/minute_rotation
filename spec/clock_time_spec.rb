require "spec_helper"
require 'clock_time'

describe "#initialize" do
  it "should initialize correctly with valid time string" do
    time = ClockTime.new "10:30 AM"
    time.hours.should eq 10
    time.minutes.should eq 30
  end

  it "should error if given invalid time string" do
    begin
      ClockTime.new "10:30"
    rescue
      $!.to_s.should eql 'Clock 10:30 is in an invalid format. Please enter in HH:MM AM/PM format.'
    end
  end
end

describe "validation" do
  it "should error if hours < 0" do
    begin
      ClockTime.new "-1:30 AM"
    rescue
      $!.to_s.should eql 'Hour must be > 0 or < 12.'
    end
  end

  it "should error if hours > 13" do
    begin
      ClockTime.new "13:30 AM"
    rescue
      $!.to_s.should eql 'Hour must be > 0 or < 12.'
    end
  end

  it "should error if minutes < 0" do
    begin
      ClockTime.new "10:-1 AM"
    rescue
      $!.to_s.should eql 'Minute must be > 0 or < 60'
    end
  end

  it "should error if minutes > 59" do
    begin
      ClockTime.new "10:60 AM"
    rescue
      $!.to_s.should eql 'Minute must be > 0 or < 60'
    end
  end

  it "should error if no AM/PM" do
    begin
      ClockTime.new "10:30 ACK"
    rescue
      $!.to_s.should eql 'AM or PM must be specified.'
    end
  end
end

describe "military" do
  it "should convert to PM hours to military" do
    time = ClockTime.new "10:30 PM"
    time.hours.should eq 22
    time.minutes.should eq 30
  end

  it "should not convert to 12 PM hours to military" do
    time = ClockTime.new "12:30 PM"
    time.hours.should eq 12
    time.minutes.should eq 30
  end
end

describe "comparison" do
  it "should correctly evaluate equal" do
    time1 = ClockTime.new "08:30 AM"
    time2 = ClockTime.new "08:30 AM"
    (time1 == time2).should be_true
  end

  it "should correctly evaluate less than" do
    time1 = ClockTime.new "08:30 AM"
    time2 = ClockTime.new "10:30 PM"
    (time1 < time2).should be_true
  end

  it "should correctly evaluate greater than" do
    time1 = ClockTime.new "10:30 PM"
    time2 = ClockTime.new "08:30 AM"
    (time1 > time2).should be_true
  end

  it "should correctly evaluate less than with same hour different minutes" do
    time1 = ClockTime.new "10:15 PM"
    time2 = ClockTime.new "10:30 PM"
    (time1 < time2).should be_true
  end

  it "should correctly evaluate greater than with same hour different minutes" do
    time1 = ClockTime.new "10:30 PM"
    time2 = ClockTime.new "10:15 PM"
    (time1 > time2).should be_true
  end
end
