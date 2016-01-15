require "spec_helper"

describe "MastermindSname::Sname" do
  describe "#start_choice" do
    it "returns a string " do
      expect { MastermindSname::Sname.new.start_choice("q") }.\
        to raise_error SystemExit
    end
  end
end
