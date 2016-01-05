require 'spec_helper'

describe SnameMessages::Messages do

 
  describe "#invalid_level" do

    it "returns a string " do
      allow(SnameMessages::Messages).to receive(:puts).and_return('t')
     expect(SnameMessages::Messages.invalid_level).to be_a String
    end
  end

  describe "#invalid_code" do

    it "returns a string " do
      allow(SnameMessages::Messages).to receive(:puts).and_return('t')
     expect(SnameMessages::Messages.invalid_code).to be_a String
    end
  end

  describe "#get_level_message" do

    it "returns a string " do
      allow(SnameMessages::Messages).to receive(:puts).and_return('t')
     expect(SnameMessages::Messages.get_level_message).to be_a String
    end
  end

  describe "#goodbye_message" do

    it "returns a string " do
      allow(SnameMessages::Messages).to receive(:puts).and_return('t')
     expect(SnameMessages::Messages.goodbye_message).to be_a String
    end
  end

  describe "#game_over_screen" do

    it "returns a string " do
      allow(SnameMessages::Messages).to receive(:puts).and_return('t')
     expect(SnameMessages::Messages.game_over_screen).to be_a String
    end
  end

  describe "#body_message" do

    let(:player_hash)  {{"game_colours"=>["r","g","y","y"],"full_level"=>"beginner", "guesses_count"=>3}}

    it "returns a string " do
      allow(SnameMessages::Messages).to receive(:puts).and_return('t')
     expect(SnameMessages::Messages.body_message(player_hash)).to be_a String
    end
  end

  describe "#splash_screen" do

    it "returns a string " do
      allow(SnameMessages::Messages).to receive(:puts).and_return('t')
     expect(SnameMessages::Messages.splash_screen).to be_a String
    end
  end

    describe "#self_border" do

    it "returns a string " do
      allow(SnameMessages::Messages).to receive(:puts).and_return('t')
     expect(SnameMessages::Messages.splash_screen).to be_a String
    end
  end

    describe "#top_ten_head" do

    it "returns a string " do
      allow(SnameMessages::Messages).to receive(:puts).and_return('t')
     expect(SnameMessages::Messages.splash_screen).to be_a String
    end
  end
end


