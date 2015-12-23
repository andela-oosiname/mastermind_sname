#require "mastermind_sname/version"
require_relative "mastermind_sname/sname/test.rb"
require_relative "mastermind_sname/sname/colour_generator.rb"
require_relative "mastermind_sname/sname/game.rb"
require_relative "mastermind_sname/sname/player_details.rb"
require_relative "mastermind_sname/sname/messages.rb"
require_relative "mastermind_sname/sname/checkers.rb"
require_relative "mastermind_sname/sname/commands.rb"
require_relative "mastermind_sname/sname/timer.rb"



module MastermindSname
  def self.start
    SnameMessages::Messages.splash_screen
    @choice = gets.chomp.downcase
    start_choice
  end
  def self.start_choice
    case @choice
    when "p", "play"
      SnameCommands::Commands.clear_screen
      SnamePlayer::Player.set_player
      SnameGame::Game.new.play
    when "q","quit"
      SnameCommands::Commands.quit_game
    when "r", "read"
      SnameMessages::Messages.get_instructions
    end

  end
end
#puts "hello"
#MastermindSname.start


