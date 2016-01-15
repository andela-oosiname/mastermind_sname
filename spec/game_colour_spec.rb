require "spec_helper"

describe "MastermindSname::GameColour" do
  before do
    player = { name: "Bayo", level: "b", full_level: "beginner" }
    @game_colour = MastermindSname::GameColour.new(player)
    player_2 = { name: "Bo", level: "a", full_level: "advanced" }
    @game_colour_2 = MastermindSname::GameColour.new(player_2)
    player_3 = { name: "Bo", level: "i", full_level: "intermediate" }
    @game_colour_3 = MastermindSname::GameColour.new(player_3)
  end
  describe "#get_colours" do
    it "returns 4" do
      expect((@game_colour.get_colours).length).to be(4)
    end

    it "returns an array" do
      expect(@game_colour.get_colours).to be_a Array
    end

    it "returns 8" do
      expect((@game_colour_2.get_colours).length).to be(8)
    end

    it "returns an Array" do
      expect(@game_colour_2.get_colours).to be_a Array
    end
  end

  describe "#get_colours" do
    it "returns 4" do
      expect(@game_colour.set_length_of_colours).to eq(4)
    end

    it "returns 6" do
      expect(@game_colour_3.set_length_of_colours).to eq(6)
    end

    it "returns 8" do
      expect(@game_colour_2.set_length_of_colours).to eq(8)
    end
  end
end
