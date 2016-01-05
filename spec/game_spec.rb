 require 'spec_helper'


describe "SnameGame::Game" do

  before do
    allow($stdout).to receive(:write)
  end

   before   do
    @game = SnameGame::Game.new
    @game.user_guess = "rryg"
    @game.game_colours = ["r","r","y","y"]
    @game.player_hash = {"level" => "b" }
    @game.user_guess_count = 0
    @game.user_guess_array = []

  end

  describe "#is_correct?" do
  	it 'returns 0' do
  		expect(@game.is_correct?).to eq(false)
  	end
  end

  describe "#get_full_level_name" do

  	it 'returns 0' do
  		expect(@game.get_full_level_name).to eq("beginner")
  	end
  end

  describe "#record_guess" do

    it 'returns 0' do
      status = "rryg has 2 of the correct elements with 3 in the correct positions"
      allow(@game).to receive(:puts).with(status)
      expect(@game.record_guess).to be_a String
    end
  end

  describe "#update_player" do

    it 'returns player hash' do

      expect(@game.update_player).to be_a Hash
    end
  end
  describe "#create_records_file" do

    it 'creates json file' do
      expect(@game.create_records_file).to eq(true)
    end
  end



  
end
#     let (:@game_colours) {["r","r","g","b"]}
#     let (:@user_guess) {"rrgb"}

#     it 'returns true' do
#       expect(@game.is_correct?).to be true
#     end
#   end

 
# end