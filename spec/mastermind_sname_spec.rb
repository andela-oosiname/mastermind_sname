require 'spec_helper'

describe MastermindSname do
  describe "#start" do

    
    describe "#show_message" do

      it "returns a string " do
        allow(@choice).to receive(:gets).and_return('t')
        expect(@game.show_letter).to be_a String
      end
    end
  end
end