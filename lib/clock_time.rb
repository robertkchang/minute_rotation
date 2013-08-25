class ClockTime
  include Comparable

  attr_accessor :hours, :minutes

  def initialize clock
    clock_arr = clock.split(/[:\s]/)
    if clock_arr.length < 3
      raise "Clock #{clock} is in an invalid format. Please enter in HH:MM AM/PM format."
    end

    validate_clock clock_arr
    convert_to_military
  end

  private

  def validate_clock clock_arr
    @hours = clock_arr[0].to_i
    @minutes = clock_arr[1].to_i
    @am_pm = clock_arr[2]

    if  @hours < 0 || @hours > 12
      raise "Hour must be > 0 or < 12."
    end

    if @minutes < 0 || @minutes > 59
      raise "Minute must be > 0 or < 60"
    end

    @am_pm.upcase!
    if @am_pm && (!['AM','PM'].include?(@am_pm))
      raise "AM or PM must be specified."
    end
  end

  def convert_to_military
    @hours += 12 if @am_pm == 'PM' && @hours != 12
  end

  def <=>(another)
    if self.hours < another.hours
      -1
    elsif self.hours == another.hours
      if self.minutes < another.minutes
        -1
      elsif self.minutes > another.minutes
        1
      else
        0
      end
    else
      1
    end
  end

  def to_s
    "#{hours}:#{minutes}"
  end
end