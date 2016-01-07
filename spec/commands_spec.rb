require "spec_helper"
describe "MastermindSname::Commands" do
  describe "#cheat_mode" do
    it "returns the code" do
      expect(MastermindSname::Commands.\
        cheat_mode(%w(r g r y))).to be_a String
    end
  end

  describe "#command_action" do
    it "returns the code" do
      expect(MastermindSname::Commands.\
        command_action("c", %w(r g r y))).to be_a String
    end
    it "returns the code" do
      expect do
        MastermindSname::Commands.\
          command_action("q", %w(r g r y))
      end.to raise_error SystemExit
    end
  end
end
