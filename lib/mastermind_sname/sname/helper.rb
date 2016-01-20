class Hash
  def stringify
    "#{self['name']} Guessed #{self['game_colours']} in "\
    " #{self['guesses']} guesses within #{self['time']} "
  end
end

module MastermindSname
  module Input
    def get_input
      gets.chomp.downcase
    end
  end
end
