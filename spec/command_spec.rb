require "spec_helper"
describe "MastermindSname::Commands" do
  before do
    @command = MastermindSname::Command.new
    @command.game_colours = %w(r g r y)
    @command.guesses = %w(rrgg ggry rrry yyrr)
  end
  describe "#cheat_mode" do
    it "returns the code and exits" do
      expect(STDOUT).to receive(:puts).with("The sequence is rgry")
      expect { @command.cheat_mode }.to raise_error SystemExit
    end
  end
  describe "#action" do
    it "returns the code and exits" do
      expect { @command.action("c", @command.game_colours, @command.guesses) }.\
        to raise_error SystemExit
    end
    it "exits the game" do
      expect { @command.action("q", @command.game_colours, @command.guesses) }.\
        to raise_error SystemExit
    end
  end

  describe "#get_history" do
    it "returns No guesses yet" do
      @command.guesses = []
      expect(@command.get_history).to eq("No guesses yet")
    end
    it "returns No guesses yet" do
      @command.guesses = %w(rryg ggrys)
      expect(STDOUT).to receive(:puts).with("Enter guess")
      @command.get_history
    end
  end
end
