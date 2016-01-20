require_relative "helper"
module MastermindSname
  class Record
    require "json"

    def initialize(player)
      @player = player
    end

    def set_new
      record = get
      record[@player[:full_level]] << {
        name: @player[:name], game_colours: @player[:game_colours].join,
        guesses: @player[:guess_count], time: @player[:time] }
      File.open("game_records.json", "w") { |f| f.write(record.to_json) }
    end

    def get
      json = File.read("game_records.json")
      records = JSON.parse(json)
      records
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
