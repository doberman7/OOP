require "csv"
class Deck
	def initialize(question=nil, answer=nil)
		@question = question
		@answer = answer
	end
end

class Item
	def initialize#("pregs.csv")
    @file = "pregs.csv"
  end
	def get_item#(number_item=1)
		item_array=[]
		CSV.foreach(@file) do |line_csv|
			item_array << Deck.new(line_csv[0],line_csv[1])
		end
		p item_array#permite ver atributs
		puts item_array
	end

end
