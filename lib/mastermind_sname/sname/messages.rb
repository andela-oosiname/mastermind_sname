module Messages
	class SnameMessages
		def self.invalid_level
			puts "Please enter a valid level, 'b' for Beginner, 'i' for Intermediate, 'a' for Advanced"
		end
		def self.invalid_code
			puts "Your colour code contains invalid letters. TIP: it should be one of r,g,y,b,o,v"
		end
		def self.get_level_message
			puts "Select your level: (b)eginner, (i)ntermediate, (a)dvanced"
		end

		def self.congratulations_screen(player_hash)
			@player_hash = player_hash
			horizontal_stars
			vertical_stars
			body_message
			vertical_stars
			horizontal_stars
		end

		def self.start_message(player_hash,game_colours)
			colours = GameColours::SnameGameColours.beginner_colours.join("") if game_colours.length == 4
			colours = GameColours::SnameGameColours.intermediate_colours.join("") if game_colours.length == 6
			colours = GameColours::SnameGameColours.advanced_colours.join("") if game_colours.length == 8
			puts "Hello #{player_hash["name"]} I have generated a sequence with #{game_colours.length} elements made up of a combination of any of: #{colours}... Can you guess the colour"
		end
		

		def self.game_over_screen
			blank_space(22)
			puts "GAME OVER"
			blank_space(16)
			puts "you are out of guesses"
		end

		def self.horizontal_stars
			30.times do
				print "* "
			end
			print "\n"
		end

		def self.vertical_stars
			3.times do
				print "*"
				blank_space(59)
				print "*"
				print "\n"
			end
		end

		def self.body_message
			blank_space(10)
			puts "CONGRATULATIONS!! You got the sequence '#{@player_hash["game_colours"].join("")}'"
			blank_space(10)
			puts "LEVEL: #{@player_hash["full_level"]}"
			blank_space(10)
			puts "GUESSES: #{@player_hash["guesses_count"]}"
		end

		def self.blank_space(n)
			n.times do
				print " "
			end
		end

		def self.message_border
			blank_space(10)
			56.times do
				print "="
			end
			print "\n"
			blank_space(20)
		end
		def self.goodbye_message
			message_border
			puts "Thank you for playing MASTERMIND"
			message_border
		end

		def self.cheat_message(colours)
			message_border
			puts "Cheat Mode.. Colour Code is: " << colours.join("")
			message_border
		end

		def self.splash_screen
			blank_space(10)
			56.times do
				print "="
			end
			print "\n"
			blank_space(10)
			puts "Welcome to MASTERMIND"
			blank_space(10)
			puts "Would you like to (p)lay, (r)ead instructions or (q)uit"
		end

		def self.border
			59.times do
				print "="
			end
			print "\n"
		end

		def self.top_ten_head
			20.times do
				print "="
			end
			print "Top Players"
			20.times do
				print "="
			end
			print "\n"
		end

		def self.get_instructions
			print "Instructions\nEnter p from splash screen to start a new game\n\nEnter your name and select a level
				\nb - beginner, code is 4 elements long\ni - intermediate, code is 6 elements long\na - advanced, code is 8 elements long
				\nRandom code of elements is generated depending on the level. You have 12 guesses
				\nafter every guess, you are presented with a message identifying the number of elements you got correctly, and in what positions.
				\nTo view entry history, enter h or history at any time.
				\nTo view sequence generated, enter c or cheat at any time
				\nTo quit the game at any point enter q or quit.
				\nThe game is timed and on successful completion, the user gets a detail of his performance and a top players list is displayed"
				puts ""
				MastermindSname::start
		end
	end
end