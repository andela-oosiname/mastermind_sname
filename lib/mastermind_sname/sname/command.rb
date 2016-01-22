require_relative "game.rb"
module MastermindSname
  class Command
    def initialize(guess, colours, guesses)
      @colours = colours
      @guesses = guesses
      @guess = guess
    end

    def action
      case @guess
      when "quit", "q" then exit
      when "cheat", "c" then cheat_mode
      when "h", "history" then get_history
      end
    end

    def cheat_mode
      puts Message.new.cheat @colours
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
