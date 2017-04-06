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
class Users#Convertir super clase
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
    all_users = []
    CSV.foreach("users.csv","a+")do |line_csv|
      all_users << line_csv
    end
    all_users.each.with_index do |item, index|
      item.unshift( index+1 )
    end
    all_users
  end
end
#-------------------------
class Admin < Users
    def initialize
      @email = "admin"
      @password = "123"
    end
end
class Buyer < Admin
  attr_accessor :email, :password
  private :user_index
end
