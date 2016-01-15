module MastermindSname
  class Record
    require "json"

    def initialize(player)
      @player = player
    end

    def set_new
      @record = get_record
      @record[@player[:full_level]] << {
        "name" => @player[:name], "game_colours" => @player[:game_colours].join,
        "guesses" => @player[:guesses_count], "times" => @player[:time] }
      File.open("game_records.json", "w") { |f| f.write(@record.to_json) }
    end

    def get_record
      json = File.read("game_records.json")
      obj = JSON.parse(json)
      obj
    end

    def display_top_ten
      Message.new.top_ten_head
      level = @player[:full_level]
      record = get_record[level].sort_by { |hsh| hsh["guesses"] }
      record.first(10).each do |val|
        puts val.stringify
      end
      print "\n"
    end
  end
end

class Hash
  def stringify
    "#{self['name']} Guessed #{self['game_colours']} in "\
    " #{self['guesses']} within #{self['times']} "
  end
end
