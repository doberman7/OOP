require "csv"

class Store
  def Product_creator
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
#---------------------------
class User#Convertir super clase
  attr_reader :email, :password
  def initialize(email=nil,password=nil)
    @email = email
    @password = password
  end
  def add_user(email,password)
    CSV.open("users.csv","a+")do |line_csv|
      line_csv << [email,password]
    end
    user_index
  end
  def user_index
    user_ary = []
    CSV.foreach("users.csv","a+")do |line_csv|
      user_ary << line_csv
    end
    user_ary.each.with_index do |item, index|
      item.unshift( index+1 )
    end
    user_ary
  end
  #private :user_index
end
#-------------------------
class Buyer < User
  attr_accessor :email, :password
end
class Admin < User
    def initialize
      @email = "admin@email.com"
      @password = "123qwe"
    end
end
