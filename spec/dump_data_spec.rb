 require 'spec_helper'
 describe BuildRecord::Sname do
 	before do
 		@data = BuildRecord::Sname.new
 	end
 	describe "#game_end" do
    # before do
    #   @game.user_guess_count = 12
    # end
    	it 'returns a Hash file' do
      		expect(@data.get_record).to be_a Hash
    	end
 	end

 end