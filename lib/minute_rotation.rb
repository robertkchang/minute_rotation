require_relative 'clock_time'

class MinuteRotation
  class << self

    def diff clock1, clock2

      time1 = ClockTime.new clock1
      time2 = ClockTime.new clock2

      hours_diff = diff_hour time1, time2 # in hours
      minutes_diff = diff_minute time1, time2 # in minutes

      degrees hours_diff, minutes_diff
    end

    private

    def diff_hour time1, time2
      if time1 <= time2
        time2.hours - time1.hours
      else
        24 - (time1.hours - time2.hours)
      end
    end

    def diff_minute time1, time2
      time2.minutes - time1.minutes
    end

    def degrees hours, minutes
      (hours * 360) + (minutes * 6)
    end
  end

  ########
  # Main #
  ########

  if $0 == __FILE__
    if ARGV.size == 0
      puts "USAGE: ruby lib/minute_rotation.rb 'HH:MM AM/PM' 'HH:MM AM/PM'"
      puts "EXAMPLE: ruby lib/minute_rotation.rb '10:15 AM' '12:45 PM'"
    else
      begin
        if ARGV.length != 2
          raise "Two clocks must be specified. EXAMPLE: ruby lib/minute_rotation.rb '10:15 AM' '12:45 PM'"
        else
          clock1 = ARGV[0]
          clock2 = ARGV[1]
          diff_degrees = MinuteRotation.diff clock1, clock2
          puts "Minute hand must rotate #{diff_degrees} degrees for #{clock1} to match #{clock2}"
        end
      rescue
        puts "Error: #{$!}"
      end
    end
  end
end