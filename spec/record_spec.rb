require "spec_helper"
describe "MastermindSname::Record" do
  let(:player) do
    { name: "Ade", full_level: "beginner",
      colours: "rrrgy", guesses: 3, time: "22" }
  end
  let(:record) { MastermindSname::Record.new(player) }

  context "#get" do
    it "returns a Hash file" do
      expect(record.get).to be_a Hash
    end
  end

  context "#display_top_ten" do
    it "returns a Array" do
      expect(record.display_top_ten).to be_a Array
    end
  end

  context "#stringify" do
    let(:player) do
      { "name" => "Ade", "full_level" => "beginner",
        "colours" => "rrrgy", "guesses" => 3, "time" => "22" }
    end
    let(:value) do
      "#{player['name']} Guessed #{player['colours']} in "\
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
