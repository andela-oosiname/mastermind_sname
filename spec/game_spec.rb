require "spec_helper"
describe "MastermindSname::Game" do
  before   do
    player = { name: "Ade", level: "b", full_level: "beginner" }
    @game = MastermindSname::Game.new(player)
    @game.guess = "rryg"
    @game.game_colours = %w(r r y y)
    @guesses = []
  end
  describe "#correct?" do
    it "returns falsey" do
      expect(@game.correct?).to eq(nil)
    end
  end

  describe "#correct?" do
    before do
      @game.guess = "rryy"
    end
    it "returns true" do
      expect(@game.correct?).to eq(true)
    end
  end

  describe "#play_again" do
    it "should exit" do
      allow(@game).to receive(:gets).and_return("j")
      expect { @game.play_again }.to raise_error SystemExit
    end
  end

  describe "#create_records_file" do
    let(:echo_msg) do
      "echo '{\"beginner\":[],\"intermediate\":[],\"advanced\":[\]}' > g"\
      "ame_records.json"
    end
    it "should create_records_file" do
      allow(@game).to receive("system").with(echo_msg)
      @game.create_records_file
    end
  end

  describe "#call sname.start" do
    it "should call #play_again" do
      allow(@game).to receive(:gets).and_return("yhhh")
      expect(@game).to receive(:play_again)
      @game.play
    end
  end

  describe "#record_guess" do
    it "returns a string" do
      expect(@game.record_guess).to be_a String
    end
  end

  describe "#update_player" do
    it "returns a string" do
      expect(@game.update_player).to be_a String
    end
  end
end
