require 'spec_helper'

describe "MastermindSname::Sname" do
 
  describe "#get_choice" do

    it "returns a string " do
     expect{MastermindSname::Sname.start_choice('q')}.to raise_error SystemExit
    end

    # it "returns a an instance of game " do
    #   allow(MastermindSname::Sname).to receive(:gets).and_return('q')
    #  expect(MastermindSname::Sname.start).to raise_error SystemExit
    # end

  end

end