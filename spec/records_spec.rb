require "spec_helper"
describe "MastermindSname::BuildRecord" do
  before do
    @data = MastermindSname::BuildRecord.new
  end
  describe "#get_record" do
    it "returns a Hash file" do
      expect(@data.get_record).to be_a Hash
    end
  end
end
