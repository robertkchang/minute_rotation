class MinuteRotation
  class << self

    def diff_degrees clock1, clock2

      time1 = ClockTime.new clock1
      time2 = ClockTime.new clock2

      hours_diff = diff_hour time1, time2 # in hours
      minutes_diff = diff_minute time1, time2 # in minutes

      degrees(hours_diff, minutes_diff)
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
end