module MastermindSname
  class Player
  	attr_accessor :level, :name

  	def self.set_player
  		set_player_name
  		set_level
  	end

  	def self.set_player_name
  	    puts "Enter first name"
  	    @name = gets.chomp.downcase
  	    @name.capitalize!
  	end 

    def self.set_level
    		puts Messages.get_level_message
    		level = gets.chomp.downcase
    		status = Logics.is_valid_level?(level)
    		while status == false do 
    			puts Messages.invalid_level
    			level = gets.chomp.downcase
    			status = Logics.is_valid_level?(level)
    		end
    		@level = level
    end

    def self.get_player
    		{name: @name, level: => @level}
    end
  end
end

