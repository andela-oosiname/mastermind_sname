require "spec_helper"

describe "MastermindSname::GameColour" do
  let(:player_beginner) { { name: "Bayo", level: "b", full_level: "beginner" } }
  let(:player_advanced) { { name: "Bo", level: "a", full_level: "advanced" } }
  let(:player_intermediat) { { name: "Bo", level: "i", full_level: "intermediate" } }
  let(:colour_beginner) { MastermindSname::GameColour.new(player_beginner) }
  let(:colour_advanced) { MastermindSname::GameColour.new(player_advanced) }
  let(:colour_intermediat) do
    MastermindSname::GameColour.new(player_intermediat)
  end

  context "#get_colours" do
    it "returns 4" do
      expect(colour_beginner.get.length).to be(4)
    end

    it "returns an array" do
      expect(colour_beginner.get).to be_a Array
    end

    it "returns 8" do
      expect(colour_advanced.get.length).to be(8)
    end

    it "returns an Array" do
      expect(colour_advanced.get).to be_a Array
    end
  end

  context "#get_colours" do
    it "returns 4" do
      expect(colour_beginner.set_length).to eq(4)
    end

    it "returns 6" do
      expect(colour_intermediat.set_length).to eq(6)
    end

    it "returns 8" do
      expect(colour_advanced.set_length).to eq(8)
    end
  end
end
