require "spec_helper"
describe "MastermindSname::Record" do
  before do
    @data = MastermindSname::Record.new
  end
  describe "#get_record" do
    it "returns a Hash file" do
      expect(@data.get_record).to be_a Hash
    end
  end
end

describe "#stringify" do
	before do
		my_record = { "name" => "Ade", "game_colours" => "rrrgy", "guesses" => 3 ,"times" => "22"}
	end
  it "returns a string" do
    expect(my_record.stringify).to be_a String
  end
end
