require "spec_helper"
describe "Integer" do
  describe "#time_format" do
    it "returns 2m40s" do
      expect(160.time_format).to eq("2m40s")
    end

    it "returns a string " do
      expect(160.time_format).to be_a String
    end
  end
end
