require_relative "record.rb"
require_relative "helper.rb"
module MastermindSname
  class Game
    include Input
    attr_accessor :guess, :start_time, :guesses
    def initialize(player, colours)
      @guesses = []
      @player = player
      @colours = colours
      puts colours.join("")
      create_records_file unless File.file?("game_records.json")
      @message = Message.new
    end

    def play
      @start_time = Time.now
      puts @message.start(@player, @colours)
      start_guessing
      play_again
    end

    def start_guessing
      loop do
        collect_user_guess
        record_guess
        break if @guesses.length > 9 || correct?
      end
      puts game_end
    end

    def correct?
      @guess == @colours.join("")
    end

    def create_records_file
      system "echo '{\"beginner\":[],\"intermediate\":[],\"advanced\":[]}' > g"\
      "ame_records.json"
    end

    def update_player
      @player[:guesses_count] = @guesses.length
      @player[:colours] = @colours
      @player[:time] = (Time.now - @start_time).round.time_format
    end

    def game_end
      if correct?
        update_player
        puts @player
        record = Record.new @player
        record.set_new
        @message.congratulations_screen @player
        record.display_top_ten
      else
        @message.game_over
      end
    end

    def collect_user_guess
      puts "#{10 - @guesses.length} guess(es) left" unless @guesses.empty?
      @guess = get_input
      loop do
        @game_logic = GameLogic.new(@guess, @colours)
        valid = @game_logic.valid_length? || @game_logic.input_command?
        Command.new(@guess, @colours, @guesses).action
        puts @game_logic.length_feedback unless valid
        @guess = get_input unless valid
        break if valid
      end
    end

    def play_again
      @message.play_again
      choice = get_input
      if choice == "y"
        Game.new(@player).play
      else
        exit
      end
    end

    def record_guess
      unless @guess == "h"
        @guesses << @guess
        correct?
        @logic = GameLogic.new(@guess, @colours)
        puts @logic.get_feedback
      end
    end
  end
end
