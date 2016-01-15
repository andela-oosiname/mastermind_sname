require_relative "game.rb"
module MastermindSname
  class Command
    attr_accessor :game_colours, :guesses
    def initialize
      @game_colours = game_colours
    end

    def action(guess, game_colours, guesses)
      @game_colours = game_colours
      @guesses = guesses
      case guess
      when "quit", "q" then exit
      when "cheat", "c" then cheat_mode
      when "h", "history" then get_history
      end
    end

    def cheat_mode
      puts Message.new.cheat(@game_colours)
      exit
    end

    def get_history
      return "No guesses yet" if @guesses.empty?
      @guesses.each_with_index\
       { |val, i| print " #{i + 1} ==> #{val} \n" }
      print "\n"
      puts "Enter guess"
    end
  end
end
