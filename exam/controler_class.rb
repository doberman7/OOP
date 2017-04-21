require_relative 'model_class.rb'
require_relative 'view_class.rb'
class Controler
	def initialize
		@adm_obj = Administrator.new
		p bring_cards
	end
	def bring_cards
		p @adm_obj.get_cards
	end
end
Controler.new
