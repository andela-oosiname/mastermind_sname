require "codeclimate-test-reporter"
CodeClimate::TestReporter.start

lib_master = File.expand_path('../../lib/mastermind_sname/sname', __FILE__)
$LOAD_PATH.unshift(lib_master) unless $LOAD_PATH.include?(lib_master)


require 'checkers'
require 'colour_generator'
require 'commands'
require 'dump_data'
require 'game'
require "mastermind_sname"
require 'messages'
require 'player_details'
require 'timer'
