require "spec_helper"

describe MastermindSname::Player do
  before do
    @player = MastermindSname::Player.new
  end

  describe "#set_player_name" do
    it "returns a string " do
      allow(@player).to receive(:gets).and_return("tayo")
      expect(@player.set_player_name).to eq("Tayo")
    end
  end

  describe "#set_level" do
    it "returns a string " do
      allow(@player).to receive(:gets).and_return("b")
      expect(@player.set_level).to eq("b")
    end

    it "returns a string " do
      allow(@player).to receive(:gets).and_return("b")
      expect(@player.set_level).to eq("b")
    end
  end

  describe "#set_player" do
    it "returns a Hash " do
      allow(@player).to receive(:gets).and_return("i")
      expect(@player.set_player).to be_a Hash
    end
  end
end
