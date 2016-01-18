require "spec_helper"
describe "MastermindSname::Game" do
  before   do
    player = { name: "Ade", level: "b", full_level: "beginner" }
    @game = MastermindSname::Game.new(player)
    @game.guess = "rryg"
    @game.game_colours = %w(r r y y)
    @guesses = []
    @game.start_time = Time.now
  end
  describe "#correct?" do
    it "returns false" do
      expect(@game.correct?).to eq(false)
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

  describe "#update_player" do
    it "returns a string" do
      expect(@game.update_player).to be_a String
    end
  end

  describe "#start_guessing" do
    before do
      @game_logic = MastermindSname::GameLogic.new("rrgy", %w(r g r y))
    end
    it "calls collect guess" do
      expect(@game).to receive(:collect_user_guess)
      @game.start_guessing
    end
  end
end
