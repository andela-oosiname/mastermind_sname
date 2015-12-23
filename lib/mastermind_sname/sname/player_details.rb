module Player
  class SnamePlayer
  	attr_accessor :level, :name

  	def self.set_player
  		set_player_name
  		set_level
  	end

  	def self.set_player_name
  	    puts "Enter name"
  	    @name = gets.chomp.downcase
  	    @name.capitalize!
  	end 

    def self.set_level
    		puts Messages::SnameMessages.get_level_message
    		level = gets.chomp.downcase
    		status = MyLogics.is_valid_level?(level)
    		while status == false do 
    			puts Messages::SnameMessages.invalid_level
    			level = gets.chomp.downcase
    			status = MyLogics.is_valid_level?(level)
    		end
    		@level = level
    end

    def self.get_player
    		player_hash = {"name" => @name, "level" => @level}

    end
  end
end
