require_relative "commands.rb"
require_relative "dump_data.rb"
module SnameGame
  class Game
    attr_accessor :level,:game_colours,:user_colours,:number_of_guesses, :user_guess, :player_hash, :user_guess_array, :user_guess_count
    def initialize_values
      @user_guess_count = 0
      @user_guess = ""
      @user_guess_array = []
      @player_hash = SnamePlayer::Player.get_player
      @game_colours = SnameGameColours::GameColours.get_colours(@player_hash["level"])
      create_records_file  unless File.file?("game_records.json")
    end

    def play
      initialize_values
      @player_hash["start_time"] = SnameTimer::Timer.set_time
      SnameMessages::Messages.start_message(@player_hash,@game_colours)
      start_guessing
      play_again 
    end

    def start_guessing
      while @user_guess_count <= 11 && !is_correct? do
        collect_user_guess
        break if @user_guess == "cheat" || @user_guess == "quit" || @user_guess == "q" || @user_guess == "c" 
        puts record_guess
      end 
      unless SnameLogics::Logics.is_input_command?(@user_guess)
        SnameCommands::Commands.clear_screen    
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
      File.file?("game_records.json")
    end


    def update_player
      @player_hash["time"] = @user_guess_array
      @player_hash["guesses_count"] = @user_guess_array.length
      @player_hash["full_level"] = get_full_level_name
      @player_hash["game_colours"] = @game_colours 
      @player_hash["end_time"] = SnameTimer::Timer.set_time
      @player_hash["time"] = SnameTimer::Timer.get_time_taken(@player_hash["start_time"],@player_hash["end_time"])
      @player_hash
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
        SnameMessages::Messages.game_over_screen 
      else
        update_player
        BuildRecord::Sname.new.set_new_record(@player_hash)
        SnameMessages::Messages.congratulations_screen(@player_hash)
        BuildRecord::Sname.new.display_top_ten(@player_hash)
      end
    end

    def collect_user_guess
      valid = false
      puts "You've taken #{@user_guess_array.length} guess(es) ...." if @user_guess_array != [] && @user_guess != "h"
      @user_guess = gets.chomp.downcase
      if @user_guess == "h"
        valid = true
        get_guess_history
      end
      until valid == true do
        valid = true if SnameLogics::Logics.is_input_command?(@user_guess)
        SnameCommands::Commands.command_action(@user_guess,@game_colours) 
        valid = SnameLogics::Logics.check_guess?(@user_guess, @player_hash["level"])  if !valid
        puts  SnameLogics::Logics.check_guess_length?(@user_guess, @player_hash["level"]) if !valid
        @user_guess = gets.chomp.downcase if !valid
      end
    end

    def user_guess_check
    end

    def play_again
      puts "Do you want to play again? (y for yes/ press any other key to quit)"
      choice = gets.chomp.downcase
      MastermindSname::Sname.start if choice == "y"
      SnameCommands::Commands.quit_game unless choice == "y"  
    end

    def get_guess_history
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
        SnameLogics::Logics.get_feedback(@user_guess,@game_colours)
      end 
    end

  end 
end
