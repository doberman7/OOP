#aqui comportamiento de
#comprar
class Store
  def creator_P
    Product.new
  end
end
class Product
  attr_accessor :q,:c, :name
  def initialize
    @quantity = q
    @cost = c
    @name = name
  end
end
class User#Convertir super clase
  attr_reader :email, :password
end
class Buyer < User

end
class Admin < User
  def initialize
    @email = "admin@email.com"
    @password = "123qwe"
  end

end
