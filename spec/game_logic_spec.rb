# require "spec_helper"

# describe @logic do
#   before do
#     @logic = MastermindSname::Logics
#   end
#   describe "#valid_level?" do
#     it "returns true" do
#       expect(@logic.valid_level?("b")).to be true
#     end

#     it "returns true" do
#       expect(@logic.valid_level?("i")).to be true
#     end

#     it "returns true" do
#       expect(@logic.valid_level?("a")).to be true
#     end

#     it "returns false" do
#       expect(@logic.valid_level?("q")).to eq nil
#     end

#     it "returns false" do
#       expect(@logic.valid_level?("1")).to eq nil
#     end
#   end
#   describe "#check_guess_length?" do
#     let(:guess) { "yygb" }
#     let(:level) { "b" }
#     let(:guess_2) { "yybggb" }
#     let(:level_2) { "i" }
#     let(:guess_3) { "yybggbgg" }
#     let(:level_3) { "a" }
#     it "returns guess is too short" do
#       expect(@logic.check_guess_length?(guess, level_2)).
#         to eq("guess is too short")
#     end
#     it "returns guess is too short" do
#       expect(@logic.check_guess_length?(guess, level_3)).
#         to eq("guess is too short")
#     end
#     it "returns guess is too long" do
#       expect(@logic.check_guess_length?(guess_2, level)).
#         to eq("guess is too long")
#     end
#     it "returns guess is too short" do
#       expect(@logic.check_guess_length?(guess_2, level_3)).
#         to eq("guess is too short")
#     end
#     it "returns guess is too long" do
#       expect(@logic.check_guess_length?(guess_3, level)).
#         to eq("guess is too long")
#     end
#     it "returns guess is too long" do
#       expect(@logic.check_guess_length?(guess_3, level_2)).
#         to eq("guess is too long")
#     end
#     it "returns okay" do
#       expect(@logic.check_guess_length?(guess_3, level_2)).\
#         to eq("guess is too long")
#     end
#   end

#   describe "#get_feedback" do
#     let(:guess) { "yygb" }
#     let(:code) { "byrr" }
#     let(:guess_2) { "bggyyb" }
#     let(:code_2) { "rrgbyy" }

#     it "returns byrr"\
#     " has 2 of the correct elements with 1 in the correct positions" do
#       expect(@logic.get_feedback(guess, code.split(""))).to eq("yygb"\
#       " has 2 of the correct elements with 1 in the correct positions")
#     end

#     it "returns bggyyb"\
#     " has 4 of the correct elements with 2 in the correct positions" do
#       expect(@logic.get_feedback(guess_2, code_2.split(""))).to eq("b"\
#         "ggyyb has 4 of the correct elements with 2 in the correct positions")
#     end
#   end

#   describe "#check_guess?" do
#     it "returns true " do
#       expect(@logic.check_guess?("asdf", "b")).to be true
#     end

#     it "returns true " do
#       expect(@logic.check_guess?("asdfsd", "i")).to be true
#     end

#     it "returns true " do
#       expect(@logic.check_guess?("asdfasdf", "a")).to be true
#     end

#     it "returns false " do
#       expect(@logic.check_guess?("asdfasdf", "b")).to be nil
#     end
#   end

#   describe "#input_command?" do
#     it "returns true" do
#       expect(@logic.input_command? "h").to be true
#     end

#     it "returns false" do
#       expect(@logic.input_command?("rrgy")).to be nil
#     end
#   end
# end