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
		Messages::SnameMessages.splash_screen
		@choice = gets.chomp.downcase
		start_choice
	end
	def self.start_choice
		case @choice
		when "p", "play"
			Commands::clear_screen
			Player::SnamePlayer.set_player
			Game::SnameGame.new.play
		when "q","quit"
			Commands::quit_game
		when "r", "read"
			puts "instructions"
		end

	end
end
MastermindSname.start


