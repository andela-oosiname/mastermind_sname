require "spec_helper"
describe "MastermindSname::Record" do
  before do
    @player = { "name" => "Ade", "game_colours" => "rrrgy", "guesses" => 3, "times" => "22" }
    @data = MastermindSname::Record.new(@player)
  end
  describe "#get_record" do
    it "returns a Hash file" do
      expect(@data.get_record).to be_a Hash
    end
  end
  describe "#stringify" do
    it "returns a string" do
      expect(@player.stringify).to be_a String
    end
  end
end
