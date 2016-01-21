module MastermindSname
  class GameLogic
    def initialize(guess, game_colour)
      @guess = guess
      @game_colour = game_colour
    end

    def length_feedback
      return "guess is too long" if @guess.length > @game_colour.length
      "guess is too short"
    end

    def input_command?
      commands = [:cheat, :exit, :h, :c, :q, :quit]
      commands.include?(@guess.to_sym)
    end

    def valid_length?
      @game_colour.length == @guess.length
    end

    def get_no_correct_elements
      no_of_elements = 0
      game_colour = @game_colour.sort
      guess = @guess.split("").sort
      game_colour.each_with_index do |val, index|
        no_of_elements += 1 if val == guess[index]
      end
      no_of_elements
    end

    def get_no_correct_positions
      correct_positions = 0
      @game_colour.each_with_index do |val, index|
        correct_positions += 1 if val == @guess[index]
      end
      correct_positions
    end

    def get_feedback
      "#{@guess} has #{get_no_correct_elements} of"\
      " the correct elements with #{get_no_correct_positions} in"\
      " the correct positions"
    end
  end
end
