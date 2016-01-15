# require "spec_helper"
# describe MastermindSname::Messages do
#   describe "#invalid_level" do
#     it "returns a string " do
#       allow(MastermindSname::Messages).to receive(:puts).and_return("t")
#       expect(MastermindSname::Messages.invalid_level).to be_a String
#     end
#   end
#   describe "#invalid_code" do
#     it "returns a string " do
#       allow(MastermindSname::Messages).to receive(:puts).and_return("t")
#       expect(MastermindSname::Messages.invalid_code).to be_a String
#     end
#   end

#   describe "#get_level_message" do
#     it "returns a string " do
#       allow(MastermindSname::Messages).to receive(:puts).and_return("t")
#       expect(MastermindSname::Messages.get_level_message).to be_a String
#     end
#   end

#   describe "#goodbye_message" do
#     it "returns a string " do
#       allow(MastermindSname::Messages).to receive(:puts).and_return("t")
#       expect(MastermindSname::Messages.goodbye_message).to be_a String
#     end
#   end
#   describe "#body_message" do
#     let(:player_hash) do
#       { game_colours: %w(r g y y), full_level: \
#         "beginner", guesses_count: 3 }
#     end
#     it "returns a string " do
#       allow(MastermindSname::Messages).to receive(:puts).and_return("t")
#       expect(MastermindSname::Messages.body_message(player_hash)).to be_a String
#     end
#   end
#   describe "#splash_screen" do
#     it "returns a string " do
#       allow(MastermindSname::Messages).to receive(:puts).and_return("t")
#       expect(MastermindSname::Messages.splash_screen).to be_a String
#     end
#   end

#   describe "#border" do
#     it "returns a string " do
#       allow(MastermindSname::Messages).to receive(:print).and_return("t")
#       expect(MastermindSname::Messages.border).to be_a String
#     end
#   end

#   describe "#top_ten_head" do
#     it "returns a string " do
#       allow(MastermindSname::Messages).to receive(:print).and_return("t")
#       expect(MastermindSname::Messages.top_ten_head).to be_a String
#     end
#   end
#   describe "#start_message" do
#     let(:player_hash) { { name: "beginner", guesses_count: 3 } }
#     let(:game_colours) { %w(r g y y) }

#     it "returns a string " do
#       allow(MastermindSname::Messages).to receive(:puts).and_return("t")
#       expect(MastermindSname::Messages.
#         start_message(player_hash, game_colours)).to be_a String
#     end
#   end
# end
