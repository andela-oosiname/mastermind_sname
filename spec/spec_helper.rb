 lib_master = File.expand_path('../../lib/mastermind_sname/sname', __FILE__)
$LOAD_PATH.unshift(lib_master) unless $LOAD_PATH.include?(lib_master)

require "mastermind_sname"
require 'timer'
require 'game'
require 'checkers'
require 'colour_generator'
require 'commands'
require 'dump_data'
require 'messages'
require 'player_details'
