class Hash
  def stringify
    "#{self['name']} Guessed #{self['colours']} in "\
    " #{self['guesses']} guesses within #{self['time']} "
  end
end

class Integer
  def time_format
    mins = self / 60
    secs = self % 60
    "#{mins}m#{secs}s"
  end
end

module MastermindSname
  module Input
    def get_input
      gets.chomp.downcase
    end
  end
end
