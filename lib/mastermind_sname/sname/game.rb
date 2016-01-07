require_relative "commands.rb"
require_relative "records.rb"
require_relative "timer.rb"
module MastermindSname
  class Game
    
    def initialize_values
      @user_guess_count = 0
      @user_guess_array = []
      @player_hash = Player.get_player
      @game_colours = GameColours.get_colours(@player_hash[:level])
      puts "#{@game_colours}"
      create_records_file  unless File.file?("game_records.json")
    end

    def play
      initialize_values
      @start_time = Time.now
      Messages.start_message(@player_hash,@game_colours)
      start_guessing
      play_again 
    end

    def start_guessing
      while @user_guess_count <= 11 && !correct? do
        collect_user_guess
        break if quit? 
        puts record_guess
      end 
      unless Logics.input_command?(@user_guess)  
        puts game_end 
      end
    end

    def quit?
      arr = ["cheat","quit","q","c"]
      true if arr.include?(@user_guess)
    end

    def correct?
      return true  if @user_guess == @game_colours.join("")
    end

    def create_records_file
      system "echo '{\"beginner\":[],\"intermediate\":[],\"advanced\":[]}' > game_records.json"
    end

    def update_player
      @player_hash[:guesses_count] = @user_guess_array.length
      @player_hash[:full_level] = get_full_level_name
      @player_hash[:game_colours] = @game_colours 
      @time = Time.now - @start_time
      @player_hash[:time] = @time.round.time_format
      @player_hash
    end

    def get_full_level_name
      case @player_hash[:level]
      when "i" then return "intermediate"
      when "b" then return "beginner"
      when "a" then   return "advanced"
      end       
    end

    def game_end
      if  @user_guess_count > 11
        return "GAME OVER! Out of Guesses" 
      else
        update_player
        BuildRecord.new.set_new_record(@player_hash)
        # Messages.congratulations_screen(@player_hash)
        # BuildRecord.new.display_top_ten(@player_hash)
      end
    end

    def collect_user_guess
      valid = false
      puts "You've taken #{@user_guess_array.length} guess(es)" if @user_guess_array != []
      @user_guess = gets.chomp.downcase
      if @user_guess == "h"
        valid = true
        return get_guess_history
      end
      until valid == true do
        valid = true if Logics.input_command?(@user_guess)
        puts Commands.command_action(@user_guess,@game_colours)
        valid = Logics.check_guess?(@user_guess, @player_hash[:level])  if !valid
        puts  Logics.check_guess_length?(@user_guess, @player_hash[:level]) if !valid
        @user_guess = gets.chomp.downcase if !valid
      end
    end

    def play_again
      puts "Do you want to play again? (y for yes/ press any other key to quit)"
      choice = gets.chomp.downcase
      if choice == "y"
        Sname.start 
      else
        exit
      end
    end

    def get_guess_history
      for i in (0...@user_guess_array.length) do print " #{i+1} ==> #{@user_guess_array[i]} \n" end
      print "\n"
      puts "Enter guess"
    end

    def record_guess
      if @user_guess != "h"
        @user_guess_count += 1 
        @user_guess_array << @user_guess 
        correct? 
        Logics.get_feedback(@user_guess,@game_colours)
      end 
    end

  end 
end
