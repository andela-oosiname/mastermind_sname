 require 'spec_helper'

 describe SnameTimer::Timer do
  describe "#format_time" do

    let (:time_interval) {2345}
    it 'returns 39m5s' do
      expect(SnameTimer::Timer.format_time(time_interval)).to eq ("39m5s")
    end

    let (:time_interval_2) {145}
    it 'returns "2m25s"' do
      expect(SnameTimer::Timer.format_time(time_interval_2)).to eq ("2m25s")
    end
  end
end