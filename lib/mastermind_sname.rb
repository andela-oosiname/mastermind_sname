require_relative "mastermind_sname/sname/checkers.rb"
require_relative "mastermind_sname/sname/colour_generator.rb"
require_relative "mastermind_sname/sname/commands.rb"
require_relative "mastermind_sname/sname/game.rb"
require_relative "mastermind_sname/sname/messages.rb"
require_relative "mastermind_sname/sname/player_details.rb"
require_relative "mastermind_sname/sname/timer.rb"

module MastermindSname
  class Sname
    def self.start
      Messages.splash_screen
      my_choice = get_choice
      start_choice(my_choice)
    end
    def self.start_choice(user_choice)
      case user_choice
      when "p", "play"
        Player.set_player
        Game.new.play
      when "q","quit" then exit
      when "r", "read" then  Messages.get_instructions
      end
    end

    def self.get_choice
      choice = gets.chomp.downcase
      choice
    end
  end
end


