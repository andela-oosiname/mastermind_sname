require_relative "game.rb"
module SnameCommands
	class Commands
		def self.command_action(to_do,colours)
			exit if to_do == "quit" || to_do == "q"
			cheat_mode(colours) if to_do == "cheat" || to_do == "c"
		end
	
		def self.cheat_mode(game_colours)
			#system "clear"
			"The sequence is #{game_colours.join}"
		end
	end

end