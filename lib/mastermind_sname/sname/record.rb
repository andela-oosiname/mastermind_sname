require_relative "helper"
module MastermindSname
  class Record
    require "json"

    def initialize(player)
      @player = player
    end

    def get
      json = File.read("game_records.json")
      obj = JSON.parse(json)
      obj
    end

    def display_top_ten
      Message.new.top_ten_head
      level = @player[:full_level]
      record = get[level].sort_by { |hsh| hsh["guesses"] }
      record.first(10).each do |val|
        puts val.stringify
      end
    end
  end
end
