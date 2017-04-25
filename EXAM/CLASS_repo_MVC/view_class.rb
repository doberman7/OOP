class View
	def separe(cards)
		cards.each.with_index do |card,index|
			until card.name.size >= 10
				card.name << " "
			end
			until card.number.size >= 11
				card.number << " "
			end

			until card.expiration.size >=  11
				card.expiration << " "
			end
			until card.cvc.size >= 6
				card.cvc << " "
			end


			puts "#{card.name}|#{card.number}|#{card.expiration}	|#{card.cvc}|#{card.status[0]}, #{card.status[1]}, #{card.status[2]}, #{card.status[3]}, #{card.status[4]}"
			puts "----------------------------------------------------------" if index == 0
		end

	end

	def test(cards)
		cards.each do |card|
		   puts "#{card.name} responds to:"
		   puts "\tName: #{card.respond_to?(:name) == true}"
		   puts "\tNumber: #{card.respond_to?(:number) == true}"
		   puts "\tExpiration: #{card.respond_to?(:expiration) == true}"
		   puts "\tcvc: #{card.respond_to?(:cvc) == true}"
		   puts "\tGet status: #{card.respond_to?(:status) == true}"
		   puts "\tSet status: #{card.respond_to?(:status) == true}"
		   puts "\n\n"
end

	end
end
