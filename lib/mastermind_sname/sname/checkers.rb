module MastermindSname
  class Logics
    def self.valid_level?(level)
      @level = level
      valid_level = [:a, :b, :i]
      true if valid_level.include?(@level.to_sym) 
    end

    def self.check_guess_length?(guess,level)
      @guess_hash = {b: 4, i: 6, a: 8}
      length = guess.length
      return "guess is too long" if length > @guess_hash[level.to_sym]
      "guess is too short" 
    end

    def self.input_command?(guess)
      commands = [:cheat, :exit, :h, :c, :q, :quit]
      true if commands.include?(guess.to_sym) 
    end

    def self.check_guess?(guess,level)
      length = guess.length
       @guess_hash = {b: 4, i: 6, a: 8}
      return true if length == @guess_hash[level.to_sym]
    end

    def self.get_no_correct_elements
      no_of_elements = 0
      for i in (0...@user_guess.length) do
        no_of_elements += 1 if @user_guess.split("").sort[i] == @colour_code.sort[i]
      end
      no_of_elements
    end

    def self.get_no_correct_positions
      correct_positions = 0
      for i in (0... @user_guess.length) do
        correct_positions += 1 if  @user_guess[i] == @colour_code[i]
      end 
      correct_positions
    end
    
    def self.get_feedback(user_guess,colour_code)
      @user_guess = user_guess
      @colour_code = colour_code
      feedback = "#{@user_guess} has #{get_no_correct_elements} of the correct elements with #{get_no_correct_positions} in the correct positions"
      feedback
    end
  end
end
