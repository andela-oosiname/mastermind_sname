require 'spec_helper'

describe SnamePlayer::Player do
	describe "#set_player_name" do

	    it "returns a string " do
	      allow(SnamePlayer::Player).to receive(:gets).and_return('tayo')
	     expect(SnamePlayer::Player.set_player_name).to eq ('Tayo')
	    end
	end

	describe "#set_level" do

	    it "returns a string " do
	      allow(SnamePlayer::Player).to receive(:gets).and_return('b')
	     expect(SnamePlayer::Player.set_level).to eq ('b')
	    end
	end

	describe "#get_player" do

	    it "returns a string " do

	     expect(SnamePlayer::Player.get_player).to be_a Hash
	    end
	end

	describe "#set_player" do

	    it "returns a string " do
	      allow(SnamePlayer::Player).to receive(:gets).and_return('i')
	     expect(SnamePlayer::Player.set_player).to eq ('i')
	    end
	end

end