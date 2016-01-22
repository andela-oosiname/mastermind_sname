require "spec_helper"
describe "MastermindSname::Game" do
  let(:player) { { name: "Ade", level: "b", full_level: "beginner" } }
  let(:colours) { %w(r r y y) }
  let(:game) { MastermindSname::Game.new(player, colours) }
  before :each do
    game.guess = "rryg"
    game.start_time = Time.now
  end
  context "#correct?" do
    it "returns false" do
      expect(game.correct?).to eq(false)
    end
  end

  context "#correct?" do
    before do
      game.guess = "rryy"
    end
    it "returns true" do
      expect(game.correct?).to eq(true)
    end
  end

  context "#play_again" do
    it "should exit" do
      allow(game).to receive(:gets).and_return("j")
      expect { game.play_again }.to raise_error SystemExit
    end
  end

  context "#create_records_file" do
    let(:echo_msg) do
      "echo '{\"beginner\":[],\"intermediate\":[],\"advanced\":[\]}' > g"\
      "ame_records.json"
    end
    it "should create_records_file" do
      allow(game).to receive("system").with(echo_msg)
      game.create_records_file
    end
  end

  context "#update_player" do
    it "returns a string" do
      expect(game.update_player).to be_a String
    end
  end

  context "#start_guessing" do
    before do
      game.guesses =  %w(q q w r t y q w e r r)
    end
    it "calls collect guess" do
      expect(game).to receive(:collect_user_guess)
      game.start_guessing
    end
  end
end
