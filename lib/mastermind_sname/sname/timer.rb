module MastermindSname
  class Integer
    def self.get_time
      mins = self/60
      secs = self%60
      "#{mins}m#{secs}s"
    end
  end
end