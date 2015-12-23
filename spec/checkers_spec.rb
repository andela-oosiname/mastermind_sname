 require 'spec_helper'

describe SnameLogics::Logics do
  describe "#is_valid_level?" do

    it 'returns true' do
      expect(SnameLogics::Logics.is_valid_level?("b")).to be true
    end

    it 'returns true' do
      expect(SnameLogics::Logics.is_valid_level?("i")).to be true
    end

    it 'returns true' do
      expect(SnameLogics::Logics.is_valid_level?("a")).to be true
    end

    it 'returns false' do
      expect(SnameLogics::Logics.is_valid_level?("q")).to be false
    end

    it 'returns false' do
      expect(SnameLogics::Logics.is_valid_level?("1")).to be false
    end
  end

    describe "#check_guess_length?" do
    		let (:guess)  {"yygb"}
    		let (:level) {"a"}
    		let (:guess_2) {"yybggb"}
    		let (:level_2) {"b"}

	    it 'returns guess is too short' do
	      expect(SnameLogics::Logics.check_guess_length?(guess,level)).to eq ("guess is too short")
	    end

	    it 'returns guess is too short' do
	      expect(SnameLogics::Logics.check_guess_length?(guess_2,level)).to eq ("guess is too short")
	    end

	    it 'returns guess is too long' do
	      expect(SnameLogics::Logics.check_guess_length?(guess_2,level_2)).to eq ("guess is too long")
	    end
  	end

    describe "#get_feedback" do
        let (:guess)  {"yygb"}
        let (:code) {"byrr"}
        let (:guess_2) {"bggyyb"}
        let (:code_2) {"rrgbyy"}

      it "returns 'byrr' has 2 of the correct elements with 1 in the correct positions" do
        expect(SnameLogics::Logics.get_feedback(guess,code.split(""))).to eq ("yygb has 2 of the correct elements with 1 in the correct positions")
      end

     it "returns 'bggyyb' has 2 of the correct elements with 1 in the correct positions" do
        expect(SnameLogics::Logics.get_feedback(guess_2,code_2.split(""))).to eq ("bggyyb has 3 of the correct elements with 2 in the correct positions")
      end
    end
end