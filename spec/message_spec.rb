require "spec_helper"
describe "MastermindSname::Message" do
  before do
    @message = MastermindSname::Message.new
  end
  describe "#invalid_level" do
    it "returns a string " do
      expect(STDOUT).to receive(:puts).with("Enter valid level,"\
       " \"b\" for Beginner, \"i\" for Intermediate, \"a\" for Advanced")
      @message.invalid_level
    end
  end

  describe "#get_level_message" do
    it "returns a string " do
      expect(STDOUT).to receive(:puts).with("Select your level:"\
        " (b)eginner, (i)ntermediate, (a)dvanced")
      @message.get_level_message
    end
  end

  describe "#goodbye_message" do
    it "returns a string " do
      expect(STDOUT).to receive(:puts).with("Thank you for playing MASTERMIND")
      @message.goodbye_message
    end
  end

  describe "#cheat" do
    let(:game_colours) { %w(r r y g) }
    it "returns a string " do
      expect(@message.cheat(game_colours)).to eq("The"\
        " sequence is #{game_colours.join}")
    end
  end

  describe "#game_over" do
    it "returns a string " do
      expect(STDOUT).to receive(:puts).with("Game Over"\
        ", You are out of Guesses")
      @message.game_over
    end
  end

  describe "#play_again" do
    it "returns a string " do
      expect(STDOUT).to receive(:puts).with("Do you want to play again? "\
        "(y for yes/ press any other key to quit)")
      @message.play_again
    end
  end
end
