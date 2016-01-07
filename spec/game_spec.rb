 require 'spec_helper'


describe "MastermindSname::Game" do

   before   do
    player = {name: "Muyiwa", level: "b"}
    @game = MastermindSname::Game.new(player)
    @game.user_guess = "rryg"
    @game.game_colours = ["r","r","y","y"]
    @user_guess_count = 0
    @user_guesses = []

  end

  describe "#correct?" do
  	it 'returns false' do
  		expect(@game.correct?).to eq(nil)
  	end
  end

  describe "#correct?" do
    before do
      @game.user_guess = "rryy"
    end
      it 'returns true' do
      expect(@game.correct?).to eq(true)
    end
  end

  describe "#get_full_level_name" do
    before do
       @game.player = {level: "b"}
    end
  	it 'returns beginner' do
  		expect(@game.get_full_level_name).to eq("beginner")
  	end
  end

  describe "#get_full_level_name" do
    before do
      @game.player = {level: "i"}
    end
    it 'returns intermediate' do
      expect(@game.get_full_level_name).to eq("intermediate")
    end
  end

  describe "#get_full_level_name" do
      before do
        @game.player = {level: "a"}
      end

    it 'returns advanced' do
      expect(@game.get_full_level_name).to eq("advanced")
    end
  end

  # describe "#record_guess" do

  #   it 'returns status' do
  #     status = "rryg has 2 of the correct elements with 3 in the correct positions"
  #     allow(@game).to receive(:puts).with(status)
  #     expect(@game.record_guess).to be_a String
  #   end
  # end

  # describe "#play_again" do

  #   it 'should exit' do
  #     allow(@game).to receive(:gets).and_return('j')
  #     expect{@game.play_again}.to raise_error SystemExit
  #   end

  # end

  # describe "#game_end" do
  #   before do
  #     @game.user_guesses = 12
  #   end
  #   it 'returns String' do
  #     expect(@game.game_end).to be_a String
  #   end
  # end
end

