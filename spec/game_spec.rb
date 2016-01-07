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

  describe "#record_guess" do

    it 'returns status' do
      status = "rryg has 2 of the correct elements with 3 in the correct positions"
      allow(@game).to receive(:puts).with(status)
      expect(@game.record_guess).to be_a String
    end
  end

  # describe "#create_records_file" do

  #   it 'creates json file' do
  #     expect(@game.create_records_file).to eq(true)
  #   end
  # end

  # describe "#get_guess_history" do

  #   it 'returns an array of guesses' do
  #     expect(@game.get_guess_history).to be_a Array
  #   end
  # end

  # describe "#play_again" do

  #   it 'should exit' do
  #     allow(@game).to receive(:gets).and_return('j')
  #     expect{@game.play_again}.to raise_error SystemExit
  #   end

  #   it 'should exit' do
  #     allow(@game).to receive(:gets).and_return('j')
  #     expect{@game.play_again}.to raise_error SystemExit
  #   end
  # end

  # describe "#game_end" do
  #   before do
  #     @game.user_guess_count = 12
  #   end
  #   it 'returns String' do
  #     expect(@game.game_end).to be_a String
  #   end
  # end

  # describe "#collect_user_guess" do
  #   it 'returns String' do
  #     allow(@game).to receive(:gets).and_return('h')
  #     expect(@game.collect_user_guess).to be_a Array
  #   end
  # end
end

