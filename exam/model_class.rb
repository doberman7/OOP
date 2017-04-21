require 'csv'
#Clase CreditCard
class CreditCard
  attr_reader :name, :number, :expiration, :cvc, :status
  def initialize(name,number,expiration,cvc,status)
    @name = name
    @number = number
    @expiration = expiration
    @cvc = cvc
    @status = status
  end
end
#PREGUNTAR: originalmente esta clase se llamaba 'Data', pero asì, desplegaba el error 'allocator undefined for Data (TypeError)'
class Administrator
  def initialize

  end
  def get_cards
    cards=[]
    CSV.foreach("cards.csv") do |line_csv|
       cards<<CreditCard.new(line_csv[0],line_csv[1],line_csv[2],line_csv[3],line_csv[4])
    end
    cards
  end
end

#Cinco instancias de CreditCard


#Array con cinco objetos de tarjetas de crédito


=begin
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
=end
