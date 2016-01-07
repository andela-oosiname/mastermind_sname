require "spec_helper"

describe MastermindSname::GameColours do
  describe "#get_colours" do
    it "returns 4" do
      expect(MastermindSname::GameColours.get_colours("b").length).to be(4)
    end

    it "returns 6" do
      expect(MastermindSname::GameColours.get_colours("i").length).to be(6)
    end

    it "returns 8" do
      expect(MastermindSname::GameColours.get_colours("a").length).to be(8)
    end
  end

  describe "#get_colours" do
    let(:level) { "b" }
    let(:level_i)  { "i" }
    let(:level_a)  { "a" }

    it "returns array" do
      expect(MastermindSname::GameColours.set_colours(level)).\
        to eq(%w(r y g b))
    end

    it "returns Array" do
      expect(MastermindSname::GameColours.set_colours(level_i)).\
        to eq(%w(r y g b o))
    end

    it "returns Array" do
      expect(MastermindSname::GameColours.set_colours(level_a)).\
        to eq(%w(r y g b o v))
    end
  end
end
