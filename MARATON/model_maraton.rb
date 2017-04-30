require "csv"
class Deck
	attr_reader :question, :answer
	def initialize(question=nil,answer=nil)
		@question = question
		@answer = answer
	end

end

class Item
	def initialize(file=nil)
		@file = file
	end
	def file_selector(file)
			case file
				when "1" then file="pregs.csv"
				#tlhe file "multiple_opt.csv" some times throws the erro "Illegal quoting in line .." so, was necesary to change the doble line quotes ("") for one line quotes ('')
				when "2" then	 file="multiple_opt.csv"
	      else puts "no hay de ese "
			end
		 @file = file
	end
	def get_it(number_item)
		items=[]
		item = nil
		CSV.foreach(@file) do |line_csv|
			items<<Deck.new(line_csv[0],line_csv[1])
		end

		items.each.with_index do |iteM, index|
			item = iteM if index == number_item
		end
		item
	end
end
