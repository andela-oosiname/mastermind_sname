module Timer
  class SnameTimer
  
    def self.set_time
      time = Time.now
      time_array = [time.hour, time.min, time.sec]
      (time_array[0] * 3600) + (time_array[1] * 60) + time_array[2]
    end

    # def self.set_end_time
    #   @end_time = Time.now
    #   end_time_array = [@end_time.hour, @end_time.min,@end_time.sec]
    #   @end_time_in_secs = (end_time_array[0] * 3600) + (end_time_array[1] * 60) + end_time_array[2]
    # end

    def self.format_time
      mins = 0
      while @time_interval > 59 do 
        mins = mins + @time_interval/60
        @time_interval -= (mins * 60)
      end
      secs = @time_interval
      return "#{secs}s" if mins == 0
      return "#{mins}m#{secs}s"
    end

    def self.get_time_taken(start_time,end_time)
      @time_interval =   end_time.to_i - start_time.to_i
      format_time
    end
  end
end