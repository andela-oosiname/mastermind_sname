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
      start_choice gets.chomp.downcase
    end

    def self.start_choice(user_choice)
      case user_choice
      when "p", "play"
        player = Player.new.set_player
        Game.new(player).play
      when "q","quit" then exit
      when "r", "read" then  Messages.get_instructions
      end
    end

  end
end


