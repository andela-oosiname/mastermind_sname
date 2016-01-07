module MastermindSname
  class BuildRecord
    require "json"
    def set_new_record(player)
      @player = player
      @record = get_record
      @new_record = @record[player[:full_level]] << {
        "name" => player[:name], "game_colours" => player[:game_colours].join,
        "guesses" => player[:guesses_count], "times" => player[:time] }
      update_level
    end

    def get_record
      json = File.read("game_records.json")
      obj = JSON.parse(json)
      obj
    end

    def update_level
      case @player[:level]
      when "b"
        update_beginner_record
      when "i"
        update_intermediate_record
      when "a"
        update_advanced_record
      end
    end

    def update_beginner_record
      temp_hash = {
        "beginner" => @new_record,
        "intermediate" => @record["intermediate"],
        "advanced" => @record["advanced"]
      }
      File.open("game_records.json", "w") do |f|
        f.write(temp_hash.to_json)
      end
    end

    def update_intermediate_record
      temp_hash = {
        "beginner" => @record["beginner"],
        "intermediate" => @new_record,
        "advanced" => @record["advanced"]
      }
      File.open("game_records.json", "w") do |f|
        f.write(temp_hash.to_json)
      end
    end

    def update_advanced_record
      temp_hash = {
        "beginner" => @record["beginner"],
        "intermediate" => @record["intermediate"],
        "advanced" => @new_record
      }
      File.open("game_records.json", "w") do |f|
        f.write(temp_hash.to_json)
      end
    end

    def display_top_ten(player)
      Messages.top_ten_head
      level = player[:full_level]
      record = get_record
      level_record = record[level].sort_by { |hsh| hsh["guesses"] }
      n = 0
      record[level].length.times do
        print "#{level_record[n]['name']} solved"\
        "#{level_record[n]['game_colours']} in "\
        "#{level_record[n]['guesses']} guesses over "\
        "#{level_record[n]['times']}"
        n += 1
        print "\n"
        break if n == 10
      end
    end
  end
end
