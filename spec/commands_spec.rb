require 'spec_helper'

describe "MastermindSname::Commands" do


	describe "#cheat_mode" do
	  	it 'returns the code' do
	  		expect(MastermindSname::Commands.cheat_mode(["r","g","r","y"])).to be_a String
	  	end
  	end

  	describe "#command_action" do
	  	it 'returns the code' do
	  		expect(MastermindSname::Commands.command_action("c",["r","g","r","y"])).to be_a String
	  	end
	  	it 'returns the code' do
	  		expect{MastermindSname::Commands.command_action("q",["r","g","r","y"])}.to raise_error SystemExit
	  	end
  	end
end