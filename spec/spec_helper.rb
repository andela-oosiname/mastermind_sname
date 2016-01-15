require "codeclimate-test-reporter"
CodeClimate::TestReporter.start
lib_master = File.expand_path("../../lib/mastermind_sname/sname", __FILE__)
$LOAD_PATH.unshift(lib_master) unless $LOAD_PATH.include?(lib_master)
require "game_logic"
require "game_colour"
require "command"
require "game"
require "mastermind_sname"
require "message"
require "player"
require "record"
