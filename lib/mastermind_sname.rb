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

    def start_choice(choice)
      case choice
      when "p", "play"
        player = Player.new.set
        colours = GameColour.new(player).get
        Game.new(player, colours).play
      when "q", "quit" then exit
      when "r", "read" then @message.get_instructions
      end
    end
  end
end
