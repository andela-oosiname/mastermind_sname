module MastermindSname
  class Player
    attr_accessor :level, :name

    def set_player
      { name: set_player_name, level: set_level }
    end

    def set_player_name
      puts "Enter first name"
      @name = gets.chomp.downcase
      @name.capitalize!
    end

    def set_level
      puts Messages.get_level_message
      level = gets.chomp.downcase
      loop do
        break if Logics.valid_level?(level)
        puts Messages.invalid_level
        level = gets.chomp.downcase
      end
      level
    end
  end
end
