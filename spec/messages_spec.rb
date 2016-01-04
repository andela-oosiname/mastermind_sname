require 'spec_helper'

describe SnameMessages::Messages do
 
  describe "#invalid_level" do

    it "returns a string " do
      allow(SnameMessages::Messages).to receive(:puts).and_return('t')
     expect(SnameMessages::Messages.invalid_level).to be_a String
    end
  end

  describe "#invalid_code" do

    it "returns a string " do
      allow(SnameMessages::Messages).to receive(:puts).and_return('t')
     expect(SnameMessages::Messages.invalid_code).to be_a String
    end
  end

  describe "#get_level_message" do

    it "returns a string " do
      allow(SnameMessages::Messages).to receive(:puts).and_return('t')
     expect(SnameMessages::Messages.get_level_message).to be_a String
    end
  end

  describe "#goodbye_message" do

    it "returns a string " do
      allow(SnameMessages::Messages).to receive(:puts).and_return('t')
     expect(SnameMessages::Messages.goodbye_message).to be_a String
    end
  end
end