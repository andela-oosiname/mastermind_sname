require_relative "game.rb"
module Commands
	class SnameCommands
		def self.command_action(to_do,colours)
			@game_colours = colours
			quit_game if to_do == "quit" || to_do == "q"
			cheat_mode if to_do == "cheat" || to_do == "c"
		end
		def self.quit_game
			clear_screen
			Messages::SnameMessages.goodbye_message
		end

		def self.clear_screen
			system "clear"
		end

		def self.cheat_mode
			clear_screen
			Messages::SnameMessages.cheat_message(@game_colours)
		end
	end

end