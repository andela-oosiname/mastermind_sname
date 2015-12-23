module SnameGameColours
	class GameColours

		attr_accessor :beginner_colours, :intermediate_colours, :advanced_colours, :level

		def self.beginner_colours
			["r","y","g","b"]
		end

		def self.intermediate_colours
			beginner_colours << "o"
		end

		def self.advanced_colours
			intermediate_colours << "v"
		end


		def self.set_colours
			case @level
				when "b"
					return beginner_colours
				when "i"
					return intermediate_colours
				when "a"
					return advanced_colours			
			end
		end

		def self.get_colours(level)
			@level = level
			final_colour_array = []
			initial_colour_array = set_colours
			set_length_of_colours
			until final_colour_array.length == @code_length
				final_colour_array << initial_colour_array.sample
			end
			final_colour_array 	
		end

		def self.set_length_of_colours
			case @level
			when "b"
				@code_length = 4
			when "i"
				@code_length = 6
			when "a"
				@code_length = 8
			end

		end
	end
end