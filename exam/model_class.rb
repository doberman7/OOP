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
  def get_cards
    cards=[]
    CSV.foreach("cards.csv") do |line_csv|
       cards<<CreditCard.new(line_csv[0],line_csv[1],line_csv[2],line_csv[3],line_csv[4..8])
    end
    cards
  end
end
