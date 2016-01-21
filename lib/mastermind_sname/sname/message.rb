module MastermindSname
  class Message
    def invalid_level
      puts "Enter valid level, \"b\" for"\
      " Beginner, \"i\" for Intermediate, \"a\" for Advanced"
    end

    def get_level_message
      puts "Select your level: (b)eginner, (i)ntermediate, (a)dvanced"
    end

    def congratulations_screen(player)
      @player = player
      horizontal_stars
      vertical_stars
      body_message
      vertical_stars
      horizontal_stars
    end

    def start(player, game_colours)
      @colours = "(r)ed, (g)reen, (y)ellow, (b)lue" if game_colours.length == 4
      @colours = "(r)ed, (g)reen, (y)ellow, (b)lue, (o)"\
      "range" if game_colours.length == 6
      @colours = "(r)ed, (g)reen, (y)ellow, (b)lue, (o)"\
      "range, (v)iolet" if game_colours.length == 8
      "Hello #{player[:name]} I have generated a code with"\
      " #{game_colours.length} elements made up of a combination of"\
      " any of: #{@colours}... Can you guess the colour"
    end

    def horizontal_stars
      30.times do
        print "* "
      end
      print "\n"
    end

    def cheat(game_colours)
      "The sequence is #{game_colours.join}"
    end

    def vertical_stars
      3.times do
        print "*"
        blank_space 59
        print "*"
        print "\n"
      end
    end

    def body_message
      blank_space 10
      puts "CONGRATS! You got the sequence #{@player[:game_colours].join}"
      blank_space 10
      puts "LEVEL: #{@player[:full_level]}"
      blank_space 10
      puts "GUESSES: #{@player[:guesses_count]}"
    end

    def blank_space(n)
      n.times do
        print " "
      end
    end

    def message_border
      blank_space(10)
      56.times do
        print "="
      end
      print "\n"
      blank_space(20)
    end

    def goodbye_message
      puts "Thank you for playing MASTERMIND"
    end

    def game_over
      puts "Game Over, You are out of Guesses"
    end

    def splash_screen
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

    def top_ten_head
      20.times do
        print "="
      end
      puts "Top Players"
      20.times do
        print "="
      end
      print "\n"
    end

    def get_instructions
      puts "Instructions\nEnter p to start
        \nEnter your name and level
        \nb - beginner, i - intermediate, a - advanced
        \nRandom code of elements. You have 10 guesses
        \nTo view guess history, enter h at any time.
        \nTo view sequence, enter c or cheat at any time
        \nTo quit the game enter q or quit.
        \nThe game is timed"
      print "\n"
      Sname.new.start_choice("p")
    end

    def play_again
      puts "Do you want to play again? (y for yes/ press any other key to quit)"
    end
  end
end
