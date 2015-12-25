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

  describe "#get_colours" do
    let (:level) {"b"}
    let (:level_i) {"i"}
    let (:level_a) {"a"}

    it 'returns ["r","y","g","b"]' do
      expect(SnameGameColours::GameColours.set_colours(level)).to eq (["r","y","g","b"])
    end

    it 'returns ["r","y","g","b","o"]' do
      expect(SnameGameColours::GameColours.set_colours(level_i)).to eq (["r","y","g","b","o"])
    end

    it 'returns ["r","y","g","b","o","v"]' do
      expect(SnameGameColours::GameColours.set_colours(level_a)).to eq (["r","y","g","b","o","v"])
    end

  end
end