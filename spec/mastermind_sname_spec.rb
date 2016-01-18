require "spec_helper"

describe "MastermindSname::Sname" do
  before do
    @sname = MastermindSname::Sname.new
    @message = MastermindSname::Message.new
    @player = MastermindSname::Player.new
  end

  describe "#start_choice" do
    it "returns a string " do
      expect { @sname.start_choice("q") }.to raise_error SystemExit
    end
  end

  describe "#start" do
    it "starts the game" do
      allow(@sname).to receive(:gets).and_return("p")
      expect(@sname).to receive(:start_choice).with("p")
      @sname.start
    end
  end
end
