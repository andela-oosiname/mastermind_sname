require "spec_helper"

describe MastermindSname::Player do
  let(:player) { MastermindSname::Player.new }

  context "#set_player_name" do
    it "returns a string " do
      allow(player).to receive(:gets).and_return("tayo")
      expect(player.set_name).to eq("Tayo")
    end
  end

  context "#set_level" do
    it "returns a string " do
      allow(player).to receive(:gets).and_return("b")
      expect(player.set_level).to eq("b")
    end

    it "returns a string " do
      allow(player).to receive(:gets).and_return("b")
      expect(player.set_level).to eq("b")
    end
  end

  context "#set_full_level" do
    it "returns beginner " do
      player.level = "b"
      expect(player.set_full_level).to eq("beginner")
    end

    it "returns beginner " do
      player.level = "a"
      expect(player.set_full_level).to eq("advanced")
    end

    it "returns beginner " do
      player.level = "i"
      expect(player.set_full_level).to eq("intermediate")
    end
  end

  context "#set_player" do
    it "returns a Hash " do
      allow(player).to receive(:gets).and_return("i")
      expect(player.set).to be_a Hash
    end
  end

  context "#valid_level?" do
    it "returns true " do
      player.level = "i"
      expect(player.valid_level?).to be true
    end

    it "returns false " do
      player.level = "g"
      expect(player.valid_level?).to be false
    end
  end
end
