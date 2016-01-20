require "spec_helper"

describe "MastermindSname::Logic" do
  let(:logic_invalid) { MastermindSname::GameLogic.new("rrgyy", %w(r g r y)) }
  let(:logic) { MastermindSname::GameLogic.new("rrgy", %w(r g r y)) }

  context "#length_feedback" do
    it "returns guess is too short" do
      expect(logic.length_feedback).to eq("guess is too short")
    end
    it "returns guess is too long" do
      expect(logic_invalid.length_feedback).to eq("guess is too long")
    end
  end
  context "#input_command?" do
    let(:logic) { MastermindSname::GameLogic.new("rrgy", %w(r g r y)) }
    let(:logic_command) { MastermindSname::GameLogic.new("c", %w(r g r y)) }

    it "returns true" do
      expect(logic_command.input_command?).to be true
    end

    it "returns false" do
      expect(logic.input_command?).to be false
    end
  end

  context "#valid_length?" do
    it "returns false" do
      expect(logic_invalid.valid_length?).to be false
    end

    it "returns true" do
      expect(logic.valid_length?).to be true
    end
  end

  context "#get_no_correct_elements" do
    let(:logic_invalid) { MastermindSname::GameLogic.new("rrgg", %w(r g r y)) }

    it "returns 2" do
      expect(logic_invalid.get_no_correct_elements).to eq(2)
    end

    it "returns 4" do
      expect(logic.get_no_correct_elements).to eq(4)
    end
  end

  context "#get_no_correct_positions" do
    let(:logic_invalid) { MastermindSname::GameLogic.new("rggg", %w(r g r y)) }
    it "returns 2" do
      expect(logic_invalid.get_no_correct_positions).to eq(2)
    end

    it "returns 2" do
      expect(logic.get_no_correct_positions).to eq(2)
    end
  end

  context "#get_feedback" do
    it "returns a string" do
      expect(logic.get_feedback).to be_a String
    end
  end

  context "#time_format" do
    it "returns 2m10s" do
      expect(130.time_format).to eq("2m10s")
    end
  end
end
