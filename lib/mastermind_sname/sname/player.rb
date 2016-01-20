module MastermindSname
  class Player
    include Input
    attr_accessor :level

    def initialize
      @message = Message.new
    end

    def set
      { name: set_name, level: set_level, full_level: set_full_level }
    end

    def set_name
      puts "Enter first name"
      @name = get_input
      @name.capitalize!
    end

    def set_level
      puts @message.get_level_message
      @level = get_input
      loop do
        break if valid_level?
        puts @message.invalid_level
        @level = get_input
      end
      @level
    end

    def set_full_level
      case @level
      when "i" then "intermediate"
      when "b" then "beginner"
      when "a" then "advanced"
      end
    end

    def valid_level?
      valid_level = [:a, :b, :i]
      valid_level.include?(@level.to_sym)
    end
  end
end
