 require 'spec_helper'

 describe SnameGameColours::GameColours do
  describe "#get_colours" do

    it 'returns 4' do
      expect(SnameGameColours::GameColours.get_colours("b").length).to be (4)
    end

    it 'returns 6' do
      expect(SnameGameColours::GameColours.get_colours("i").length).to be (6)
    end

    it 'returns 8' do
      expect(SnameGameColours::GameColours.get_colours("a").length).to be (8)
    end
  end
end