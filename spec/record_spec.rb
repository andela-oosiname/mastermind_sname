require "spec_helper"
describe "MastermindSname::Record" do
  before do
    @player = { name: "Ade", full_level: "beginner",
                game_colours: "rrrgy", guesses: 3, time: "22" }
    @record = MastermindSname::Record.new(@player)
  end

  context "#get_record" do
    it "returns a Hash file" do
      expect(@record.get).to be_a Hash
    end
  end

  context "#display_top_ten" do
    it "returns a Array" do
      expect(@record.display_top_ten).to be_a Array
    end
  end
  context "#stringify" do
    let(:player) do
      { "name" => "Ade", "full_level" => "beginner",
        "game_colours" => "rrrgy", "guesses" => 3, "time" => "22" }
    end
    let(:value) do
      "#{player['name']} Guessed #{player['game_colours']} in "\
      " #{player['guesses']} guesses within #{player['time']} "
    end

    it "returns a string" do
      expect(player.stringify).to be_a String
    end

    it "returns a string" do
      expect(player.stringify).to eq value
    end
  end
end
