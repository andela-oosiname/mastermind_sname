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
          create_records_file  unless File.file?("game_records.json")
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
        record_guess
      end 
      unless MyLogics::is_input_command?(@user_guess)
      Commands::SnameCommands.clear_screen    
      game_end     
      end
    end

    def is_correct?
      if @user_guess == @game_colours.join("")
        return true 
      else
        return false
      end
    end

    def create_records_file
      system "echo '{\"beginner\":[],\"intermediate\":[],\"advanced\":[]}' > game_records.json"
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
      when "a" then   return "advanced"
      end       
    end

    def game_end
      if  @user_guess_count > 11
        Messages::SnameMessages.game_over_screen 
      else
        update_player
        BuildRecord::Sname.new.set_new_record(@player_hash)
        Messages::SnameMessages.congratulations_screen(@player_hash)
        BuildRecord::Sname.new.display_top_ten(@player_hash)
      end
      play_again
    end

    def collect_user_guess
      valid = false
      puts "You've taken #{@user_guess_array.length} guess(es) .... #{@guess_left} left" if @user_guess_array != [] && @user_guess != "h"
      @user_guess = gets.chomp.downcase
      if @user_guess == "h"
        valid = true
        get_guess_history
      end
      until valid == true do
        if MyLogics::is_input_command?(@user_guess)
          valid = false
          return Commands::SnameCommands.command_action(@user_guess,@game_colours) 
        end
        valid = MyLogics::check_guess?(@user_guess, @player_hash["level"])  if !valid
        puts MyLogics::check_guess_length?(@user_guess, @player_hash["level"])  if !valid
        @user_guess = gets.chomp.downcase if !valid 
      end
    end

    def play_again
      puts "Do you want to play again? (y for yes/ press any other key to quit)"
      choice = gets.chomp.downcase
      MastermindSname::start if choice == "y"
      Commands::SnameCommands.quit_game unless choice == "y"  
    end

    def get_guess_history
      puts "Guess History"
      if @user_guess_array.length > 0
        for i in (0...@user_guess_array.length) do print " #{i+1} ==> #{@user_guess_array[i]} \n" end
        print "\n"
      else
        puts "history is empty"
      end
      puts "Enter guess"
    end

    def record_guess
      if @user_guess != "h"
        @user_guess_count += 1 
        @user_guess_array << @user_guess 
        is_correct? 
        puts MyLogics::get_feedback(@user_guess,@game_colours)
      end 
    end

  end 
end
