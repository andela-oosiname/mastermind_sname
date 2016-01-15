require "spec_helper"
describe "MastermindSname::Record" do
  before do
    @data = MastermindSname::Record.new
  end
  describe "#get_record" do
    it "returns a Hash file" do
      expect(@data.get_record).to be_a Hash
    end
  end
end
