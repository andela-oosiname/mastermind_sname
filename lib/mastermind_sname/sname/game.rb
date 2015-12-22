require_relative "commands.rb"
require_relative "dump_data.rb"
module Game
	class SnameGame
		attr_accessor :level,:game_colours,:user_colours,:number_of_guesses, :name

		def initialize_values

			@user_guess_count = 0
	        @user_guess = ""
	        @game_colours = GameColours::SnameGameColours.get_colours
	        @user_guess_array = []
	        @player_hash = Player::SnamePlayer.get_player
		end

		def play
			initialize_values
			@player_hash["start_time"] = Timer::SnameTimer.set_time
			puts "#{@game_colours}"
			Messages::SnameMessages.start_message(@player_hash,@game_colours)
			while @user_guess_count <= 11 && !is_correct? do
				@guess_left =  12 - @user_guess_count 
				collect_user_guess
				break if @user_guess == "cheat" || @user_guess == "quit" || @user_guess == "q" || @user_guess == "c" 
				if @user_guess != "h"
					@user_guess_count += 1 
					@user_guess_array << @user_guess 
					is_correct?	
				end	
				puts MyLogics::get_feedback(@user_guess,@game_colours)	unless	@user_guess == "h"
			end 
			update_player
			unless MyLogics::is_input_command?(@user_guess) && @user_guess == "h"
				Commands::clear_screen
				BuildRecord::Sname.new.set_new_record(@player_hash) if is_correct?
				game_end if is_correct?			
			end
		end

		def is_correct?
			if @user_guess == @game_colours.join("")
				return true 
			else
				return false
			end
		end

		def update_player
			@player_hash["time"] = @user_guess_array
			@player_hash["guesses_count"] = @user_guess_array.length
			@player_hash["full_level"] = get_full_level_name
			@player_hash["game_colours"] = @game_colours 
			@player_hash["end_time"] = Timer::SnameTimer.set_time
			@player_hash["time"] = Timer::SnameTimer.get_time_taken(@player_hash["start_time"],@player_hash["end_time"])
		end

		def get_full_level_name
			case @player_hash["level"]
			when "i" then return "intermediate"
			when "b" then return "beginner"
			when "a" then 	return "advanced"
			end				
		end

		def game_end
			if  @user_guess_count > 11
				Messages::SnameMessages.game_over_screen 
			else
				update_player
				Messages::SnameMessages.congratulations_screen(@player_hash)
				BuildRecord::Sname.new.display_top_ten(@player_hash)
			end
			play_again
		end

		def collect_user_guess
			valid = false
			puts "You've taken #{@user_guess_array.length} guess(es) .... #{@guess_left}"\
			"left" if @user_guess_array != [] && @user_guess != "h"
			@user_guess = gets.chomp.downcase
			if @user_guess == "h"
				valid = true
				get_guess_history
			end
			until valid == true do
				if MyLogics::is_input_command?(@user_guess)
					valid = false
					return Commands::command_action(@user_guess,@game_colours,@user_guess_array) 
					break
				end
				valid = MyLogics::check_guess?(@user_guess, @player_hash["level"])  if !valid
				puts MyLogics::check_guess_length?(@user_guess, @player_hash["level"])  if !valid
				@user_guess = gets.chomp.downcase if !valid	
			end
		end

		def play_again
			puts "Do you want to play again? (y for yes/ press any other key to quit)"
			choice = gets.chomp.downcase
			if choice == "y"
				MastermindSname::start
			else 
				Commands::quit_game
			end
		end

		def get_guess_history
			puts "Guess History"
			if @user_guess_array.length > 0
				n = 1
				for i in (0...@user_guess_array.length) do print " #{i+1} ==> #{@user_guess_array[i]} \n" end
				print "\n"
			else
				puts "history is empty"
			end
			puts "Enter guess"
		end
	end	
end
