require "spec_helper"
describe "MastermindSname::Record" do
  before do
    @player_3 = { "name" => "Ade", "full_level" => "beginner",
                "game_colours" => "rrrgy", "guesses" => 3, "time" => "22" }
    @player_2 = { name: "Ade", full_level: "beginner",
                  game_colours: "rrrgy", guesses: 3, time: "22" }
    @data = MastermindSname::Record.new(@player_2)
    @data.player = @player_2
  end
  describe "#get_record" do
    it "returns a Hash file" do
      expect(@data.get_record).to be_a Hash
    end
  end

  describe "#display_top_ten" do
    it "returns a Array" do
      expect(@data.display_top_ten).to be_a Array
    end
  end
  describe "#stringify" do
    it "returns a string" do
      expect(@player_3.stringify).to be_a String
    end
  end
end
