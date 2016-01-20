require_relative "mastermind_sname/sname/game_logic.rb"
require_relative "mastermind_sname/sname/game_colour.rb"
require_relative "mastermind_sname/sname/command.rb"
require_relative "mastermind_sname/sname/game.rb"
require_relative "mastermind_sname/sname/message.rb"
require_relative "mastermind_sname/sname/helper.rb"
require_relative "mastermind_sname/sname/player.rb"

module MastermindSname
  class Sname
    include Input
    def start
      @message = Message.new
      @message.splash_screen
      start_choice get_input
    end

    def start_choice(user_choice)
      case user_choice
      when "p", "play"
        player = Player.new.set
        game_colours = GameColour.new(player).get
        Game.new(player, game_colours).play
      when "q", "quit" then exit
      when "r", "read" then @message.get_instructions
      end
    end
  end
end
