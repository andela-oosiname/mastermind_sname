module MastermindSname
  class Player
  	attr_accessor :level, :name

  	def set_player
  		{name: set_player_name, level: set_level}
  	end

  	def set_player_name
  	    puts "Enter first name"
  	    @name = gets.chomp.downcase
  	    @name.capitalize!
  	end 

    def set_level
    		puts Messages.get_level_message
    		level = gets.chomp.downcase
    		status = Logics.valid_level?(level)
    		while status == false do 
    			puts Messages.invalid_level
    			level = gets.chomp.downcase
    			status = Logics.valid_level?(level)
    		end
        level
    end

  end
end

