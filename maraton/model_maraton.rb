require "csv"
class Deck
	attr_reader :question, :answer
	def initialize(question=nil, answer=nil)
		@question = question
		@answer = answer
	end

end

class Item
	def initialize(file = "pregs.csv")
    @file = file
	end
	def get_it(number_item)
		items=[]
		item = nil
		CSV.foreach(@file) do |line_csv|
			items << Deck.new(line_csv[0],line_csv[1])
		end
		items.each.with_index do |iteM, index|
			item = iteM if index == number_item
		end
		item
	end

end
