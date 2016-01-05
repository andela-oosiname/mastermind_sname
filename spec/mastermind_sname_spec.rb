require 'spec_helper'

describe "MastermindSname:;Sname" do
 
  describe "#get_choice" do

    it "returns a string " do
      allow(MastermindSname::Sname).to receive(:gets).and_return('t')
     expect(MastermindSname::Sname.get_choice).to be_a String
    end
  end

end