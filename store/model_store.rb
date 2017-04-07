require "csv"

class Product
  attr_accessor :quantity,:cost, :name
  def initialize
    @quantity = quantity
    @cost = cost
    @name = name
  end
  def create_product(product)
    puts "Enter quantity"
    product.quantity = gets.chomp
    puts "Enter cost"
    product.cost= gets.chomp
    product.cost.insert(0,"$")
    puts "Enter name"
    product.name= gets.chomp
    CSV.open("products.csv","a+")do |line_csv|
      line_csv << [product.quantity, product.cost, product.name]
    end
    product_index
  end
  def product_index
    all_products = []
    CSV.foreach("products.csv","a+")do |line_csv|
      all_products << line_csv
    end
    puts "# Quantity  Cost  Name"
    all_products.each.with_index do |item, index|
      puts item.unshift( index+1 ).join "     "
    end
  end
end
#---------------------------
class Users#Clase padre
  attr_reader :email, :password
  def initialize(email=nil,password=nil)
    @email = email
    @password = password
  end
  def add_user(email,password)
    CSV.open("users.csv","a+")do |line_csv|
      line_csv << [email,password]
    end
    #user_index
  end
  def user_index
    all_users = []
    CSV.foreach("users.csv","a+")do |line_csv|
      all_users << line_csv
    end
    puts "# EMAIL PASSWORD"
    all_users.each.with_index do |item, index|
      puts item.unshift( index+1 ).join " "
    end
  end
  def user_index_no_visible
    all_users = []
    CSV.foreach("users.csv","a+")do |line_csv|
      all_users << line_csv
    end
    all_users.each.with_index do |item, index|
      item.unshift( index+1 )
    end
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
