module BuildRecord
	class Sname
		require 'json'
		def set_new_record(player_hash)
			@player_hash = player_hash
			@record = get_record
			@new_record = @record[player_hash["full_level"]] << {"name"=>player_hash["name"],"game_colours" => player_hash["game_colours"].join(""), "guesses" => player_hash["guesses_count"], "times" => player_hash["time"]}
			select_level
		end 
		def get_record
			json = File.read("game_records.json")
			obj = JSON.parse(json)
			return obj
		end
		
		
		def select_level
			case @player_hash["level"]
			when "b"
				update_beginner_record
			when "i"
				update_intermediate_record
			when "a"
				 update_advanced_record
			end	
		end

		def update_beginner_record
			tempHash = {
			    "beginner" => @new_record,
			    "intermediate" => @record["intermediate"],
			    "advanced" => @record["advanced"]
			}
			File.open("game_records.json","w") do |f|
			  f.write(tempHash.to_json)
			end
		end

		def update_intermediate_record
			tempHash = {
			    "beginner" => @record["beginner"],
			    "intermediate" => @new_record,
			    "advanced" => @record["advanced"]
			}
			File.open("game_records.json","w") do |f|
			  f.write(tempHash.to_json)
			end
		end
		def update_advanced_record
			tempHash = {
			    "beginner" => @record["beginner"],
			    "intermediate" => @record["intermediate"],
			    "advanced" => @new_record
			}
			File.open("game_records.json","w") do |f|
			  f.write(tempHash.to_json)
			end
		end

		def display_top_ten(player_hash)
			Messages::SnameMessages.top_ten_head
			level = player_hash["full_level"]
			record = get_record
			level_record = record[level].sort_by { |hsh| hsh["guesses"] }
			n = 0
			loop {
				print "#{level_record[n]["name"]} solved #{level_record[n]["game_colours"]} in #{level_record[n]["guesses"]} guesses over #{level_record[n]["times"]}"
				n += 1
				print "\n"
				break if n == record[level].length  || n == 10
			}
			
		end
	end
end
