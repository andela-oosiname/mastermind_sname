require_relative "commands.rb"
require_relative "records.rb"
require_relative "timer.rb"
module MastermindSname
  class Game
    attr_accessor :game_colours, :guess, :player,
                  :start_time, :user_guesses
    def initialize(player)
      @user_guess_count = 0
      @user_guesses = []
      @player = player
      @game_colours = GameColours.get_colours(@player[:level])
      puts "#{@game_colours}"
      create_records_file unless File.file?("game_records.json")
    end

    def play
      @start_time = Time.now
      puts Messages.start_message(@player, @game_colours)
      start_guessing
      play_again
    end

    def start_guessing
      loop do
        collect_user_guess
        exit if quit?
        puts record_guess
        break if @user_guess_count > 10 || correct?
      end
      unless Logics.input_command?(@guess)
        puts game_end
      end
    end

    def quit?
      arr = %w(cheat quit q c)
      true if arr.include?(@guess)
    end

    def correct?
      return true  if @guess == @game_colours.join("")
    end

    def create_records_file
      system "echo '{\"beginner\":[],\"intermediate\":[],\"advanced\":[]}' > g"\
      "ame_records.json"
    end

    def update_player
      @player[:guesses_count] = @user_guesses.length
      @player[:full_level] = get_full_level_name
      @player[:game_colours] = @game_colours
      @time = Time.now - @start_time
      @player[:time] = @time.round.time_format
    end

    def get_full_level_name
      case @player[:level]
      when "i" then return "intermediate"
      when "b" then return "beginner"
      when "a" then return "advanced"
      end
    end

    def game_end
      if correct?
        update_player
        BuildRecord.new.set_new_record @player
        Messages.congratulations_screen @player
        BuildRecord.new.display_top_ten @player
      else
        "GAME OVER! Out of Guesses"
      end
    end

    def collect_user_guess
      valid = false
      puts "#{10 - @user_guesses.length} guess(es) left" if @user_guesses != []
      @guess = gets.chomp.downcase
      if @guess == "h"
        valid = true
        return get_guess_history
      end
      loop do
        break if valid
        valid = true if Logics.input_command?(@guess)
        puts Commands.command_action(@guess, @game_colours)
        valid = Logics.check_guess?(@guess, @player[:level]) unless valid
        puts Logics.
          check_guess_length?(@guess, @player[:level]) unless valid
        @guess = gets.chomp.downcase unless valid
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
      @user_guesses.each\
       { print " #{i + 1} ==> #{@user_guesses[i]} \n" }
      print "\n"
      puts "Enter guess"
    end

    def record_guess
      if @guess != "h"
        @user_guess_count += 1
        @user_guesses << @guess
        correct?
        Logics.get_feedback(@guess, @game_colours)
      end
    end
  end
end
