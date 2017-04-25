#fue mas comodo meter datos en constantes
Amex=["Amex", "2345673444", "12/15", "2345", ["234", "567", "456", "567", "344"]]
ScotiaBank=["ScotiaBank", "2345673744", "12/16", "2845", ["234", "345", "456", "567", "344"]]
Bancomer=["Bancomer", "2345673444", "12/15", "2645", ["234", "345", "456", "567", "344"]]
Serfin=["Serfin", "2345473454", "12/20", "1345", ["234", "345", "456", "567", "344"]]
BanCoppel=["BanCoppel", "2345373464", "12/18", "2445", ["567","345", "456", "567", "344"]]

#Clase CreditCard
class CreditCard
	attr_reader :name, :number, :expiration, :cvc
	attr_accessor :status
	def initialize(array)
		@name = array[0]
    @number = array[1]
    @expiration = array[2]
    @cvc = array[3]
    @status = array[4]
	end
end

#Cinco instancias de CreditCard
 amex = CreditCard.new(Amex)
 scot = CreditCard.new(ScotiaBank)
 bancomer = CreditCard.new(Bancomer)
 serfin = CreditCard.new(Serfin)
 banCoppel = CreditCard.new(BanCoppel)

#Array con cinco objetos de tarjetas de crédito
cards=[amex,scot,bancomer,serfin,banCoppel]


#tests

cards.each do |card|
   puts "#{card.name} responds to:"
   puts "\tName: #{card.respond_to?(:name) == true}"
   puts "\tNumber: #{card.respond_to?(:number) == true}"
   puts "\tExpiration: #{card.respond_to?(:expiration) == true}"
   puts "\tcvc: #{card.respond_to?(:cvc) == true}"
   puts "\tGet status: #{card.respond_to?(:status) == true}"
   puts "\tSet status: #{card.respond_to?(:status=) == true}"
   puts "\n\n"
end

#método para mostrar datos de tarjetas
def show_data(cards)
	puts " " * 2 + "Name"+ " " * 4 + "|" + " " * 2 + "Number" + " " * 3 + "|" + " " * 3 + "Expiration" + " " * 4 + "|" + "  CVC" + " " * 3 + "|" + + " " * 3 + "    Status"
	#{}+ "|" + "status"
	puts "----------------------------------------------------------"
	cards.each.with_index do |card,index|
		until card.name.size >= 10
			card.name << " "
		end
		until card.number.size >= 11
			card.number << " "
		end

		until card.expiration.size >=  5
			card.expiration << " "
		end
		until card.cvc.size >= 6
			card.cvc << " "
		end

		puts "#{card.name}|#{   card.number}|     #{card.expiration}	|  #{card.cvc}| [#{card.status[0]}, #{card.status[1]}, #{card.status[2]}, #{card.status[3]}, #{card.status[4]}]"

	end
end
show_data(cards)
