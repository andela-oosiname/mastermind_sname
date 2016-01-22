require "spec_helper"
describe "MastermindSname::Commands" do
  let(:command_cheat) do
    MastermindSname::Command.new("c", colours, guesses)
  end
  let(:command_history) do
    MastermindSname::Command.new("h", colours, guesses)
  end
  let(:command_empty_history) do
    MastermindSname::Command.new("h", colours, [])
  end
  let(:command_exit) do
    MastermindSname::Command.new("q", colours, guesses)
  end
  let(:colours) { %w(r g r y) }
  let(:guesses) { %w(rrgg ggry rrry yyrr) }

  context "#cheat_mode" do
    it "returns the code and exits" do
      expect(STDOUT).to receive(:puts).with("The sequence is rgry")
      expect { command_cheat.cheat_mode }.to raise_error SystemExit
    end
  end

  context "#action" do
    it "returns the code and exits" do
      expect { command_cheat.action }.to raise_error SystemExit
    end
    it "exits the game" do
      expect { command_exit.action }.to raise_error SystemExit
    end
    it "returns history" do
      expect(command_history).to receive(:get_history)
      command_history.action
    end
  end

  context "#get_history" do
    it "returns No guesses yet" do
      expect(command_empty_history.get_history).to eq("No guesses yet")
    end
    it "returns No guesses yet" do
      expect(STDOUT).to receive(:puts).with("Enter guess")
      command_history.get_history
    end
  end
end
