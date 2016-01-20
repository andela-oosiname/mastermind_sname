require "spec_helper"
describe "MastermindSname::Message" do
  before do
    @message = MastermindSname::Message.new
  end
  context "#invalid_level" do
    it "returns a string " do
      expect(STDOUT).to receive(:puts).with("Enter valid level,"\
       " \"b\" for Beginner, \"i\" for Intermediate, \"a\" for Advanced")
      @message.invalid_level
    end
  end

  context "#get_level_message" do
    it "returns a string " do
      expect(STDOUT).to receive(:puts).with("Select your level:"\
        " (b)eginner, (i)ntermediate, (a)dvanced")
      @message.get_level_message
    end
  end

  context "#goodbye_message" do
    it "returns a string " do
      expect(STDOUT).to receive(:puts).with("Thank you for playing MASTERMIND")
      @message.goodbye_message
    end
  end

  context "#cheat" do
    let(:game_colours) { %w(r r y g) }
    it "returns a string " do
      expect(@message.cheat(game_colours)).to eq("The"\
        " sequence is #{game_colours.join}")
    end
  end

  context "#game_over" do
    it "returns a string " do
      expect(STDOUT).to receive(:puts).with("Game Over"\
        ", You are out of Guesses")
      @message.game_over
    end
  end

  context "#play_again" do
    it "returns a string " do
      expect(STDOUT).to receive(:puts).with("Do you want to play again? "\
        "(y for yes/ press any other key to quit)")
      @message.play_again
    end
  end

  context "#congratulations_screen" do
    let(:player) do
      { game_colours: %w(r r r y),
        full_level: "beginner", guesses_count: 3 }
    end
    it "calls #horizontal_stars" do
      expect(@message).to receive(:horizontal_stars).twice
      @message.congratulations_screen(player)
    end

    it "calls #vertical_stars" do
      expect(@message).to receive(:vertical_stars).twice
      @message.congratulations_screen(player)
    end

    it "calls #body_message" do
      expect(@message).to receive(:body_message)
      @message.congratulations_screen(player)
    end
  end

  context "#splash_screen" do
    it "returns a string " do
      expect(STDOUT).to receive(:puts).with("Would you like to (p)lay"\
        ", (r)ead instructions or (q)uit")
      expect(STDOUT).to receive(:puts).with("Welcome to MASTERMIND")
      @message.splash_screen
    end
  end

  context "#splash_screen" do
    let(:player) do
      { name: "Ade", full_level: "beginner", guesses_count: 3 }
    end
    let(:game_colours) { %w(r r r y) }
    it "returns a string " do
      expect(@message.start(player, game_colours)).to be_a String
    end
  end

  context "#message_border" do
    it "calls blank space " do
      expect(@message).to receive(:blank_space).with(10)
      expect(@message).to receive(:blank_space).with(20)
      @message.message_border
    end
  end

  context "#top_ten_head" do
    it "calls blank space " do
      expect(STDOUT).to receive(:puts).with("Top Players")
      @message.top_ten_head
    end
  end
end
