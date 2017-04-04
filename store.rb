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
# class User#Convertir super clase
#   attr_accessor :email, :password
#   def initialize
#     @email = email
#     @pasword = pasword
#   end
# end
#hacer que las clase user herede sus atributos a:
  #sub vendedor
  #sub admin
  # sub user

User = Struct.new(:email, :pasword)
class Seller < User

end
class Admin < User
end
