require 'spec_helper'

describe MastermindSname do
 
  describe "#get_choice" do

    it "returns a string " do
      allow(MastermindSname).to receive(:gets).and_return('t')
     expect(MastermindSname.get_choice).to be_a String
    end
  end

  # describe "#start_choice" do
  #   let (:choice) {"p"}

  #   it "returns a string " do
  #     allow(MastermindSname).to receive(:gets).and_return('r')
  #     allow(SnameGame::Game).to receive(:gets).and_return('ss')
  #    expect(MastermindSname.start_choice(choice)).to be_a String
  #   end
  # end

end