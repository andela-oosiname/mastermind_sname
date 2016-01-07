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

  describe "#play_again" do
    it 'should exit' do
      allow(@game).to receive(:gets).and_return('j')
      expect{@game.play_again}.to raise_error SystemExit
    end
  end

  describe "#create_records_file" do
    it 'should create_records_file' do
      allow(@game).to receive("system").with("echo '{\"beginner\":[],\"intermediate\":[],\"advanced\":[]}' > game_records.json")
      @game.create_records_file
    end
  end

  describe "#call sname.start" do
    it 'should exit' do
      allow(@game).to receive(:gets).and_return('yhhh')
      expect(@game).to receive(:play_again)
      @game.play
    end
  end

end
