module MastermindSname
  class GameColour
    def initialize(player)
      @level = player[:level]
      @colours = { b: %w(r y g b), i: %w(r y g b o), a: %w(r y g b o v) }
    end

    def get
      final_colour = []
      initial_colour = @colours[@level.to_sym]
      code_length = set_length
      until final_colour.length == code_length
        final_colour << initial_colour.sample
      end
      final_colour
    end

    def set_length
      case @level
      when "b" then return 4
      when "i" then return 6
      when "a" then return 8
      end
    end
  end
end
