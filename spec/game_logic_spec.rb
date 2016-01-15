require "spec_helper"

describe "MastermindSname::Logic" do
  before do
    @logic = MastermindSname::GameLogic.new("rrgy", %w(r g r y))
    @logic_2 = MastermindSname::GameLogic.new("rrgyy", %w(r g r y))
  end

  describe "#length_feedback" do
    it "returns guess is too short" do
      expect(@logic.length_feedback).to eq("guess is too short")
    end
    it "returns guess is too long" do
      expect(@logic_2.length_feedback).to eq("guess is too long")
    end
  end
  describe "#input_command?" do
    before do
      @logic = MastermindSname::GameLogic.new("rrgy", %w(r g r y))
      @logic_2 = MastermindSname::GameLogic.new("c", %w(r g r y))
    end

    it "returns true" do
      expect(@logic_2.input_command?).to be true
    end

    it "returns false" do
      expect(@logic.input_command?).to be nil
    end
  end

  describe "#valid_length?" do
    it "returns false" do
      expect(@logic_2.valid_length?).to be false
    end

    it "returns true" do
      expect(@logic.valid_length?).to be true
    end
  end

  describe "#get_no_correct_elements" do
    before do
      @logic = MastermindSname::GameLogic.new("rrgy", %w(r g r y))
      @logic_2 = MastermindSname::GameLogic.new("rrgg", %w(r g r y))
    end
    it "returns 2" do
      expect(@logic_2.get_no_correct_elements).to eq(2)
    end

    it "returns 4" do
      expect(@logic.get_no_correct_elements).to eq(4)
    end
  end

  describe "#get_no_correct_positions" do
    before do
      @logic = MastermindSname::GameLogic.new("rrgy", %w(r g r y))
      @logic_2 = MastermindSname::GameLogic.new("rggg", %w(r g r y))
    end
    it "returns 2" do
      expect(@logic_2.get_no_correct_positions).to eq(2)
    end

    it "returns 2" do
      expect(@logic.get_no_correct_positions).to eq(2)
    end
  end

end

