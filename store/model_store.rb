require "csv"
#class with the prodcut methods
class Product
  attr_accessor :quantity,:cost, :name
  def initialize
    @quantity = quantity
    @cost = cost
    @name = name
  end
  #to create products
  def create_product(product)
    puts "Enter quantity"
    product.quantity = gets.chomp
    puts "Enter cost"
    product.cost= gets.chomp
    product.cost.insert(0,"$")
    puts "Enter name"
    product.name= gets.chomp
    #the CSV file is open with write capabilities
    CSV.open("products.csv","a+")do |line_csv|
      #the three instance varibles are put in a line of the csv file
      line_csv << [product.quantity, product.cost, product.name]
    end
    #to finish the index of product are shown with the new item included
    product_index
  end
  #to see all the products
  def product_index
    #an emtu array is used
    all_products = []
    CSV.foreach("products.csv","a+")do |line_csv|
     #each line of the csv file is push it in the array
      all_products << line_csv
    end
    puts "# Quantity  Cost  Name"
    #then to all_products a index is added
    all_products.each.with_index do |item, index|
      #each index is put at the begining at the item, an turn into a string
      puts item.unshift( index+1 ).join "     "
    end
  end
  #return the selected_input or "not founded"
  def select_article
    selected_input = gets.to_i
    selected = nil
    all_products = []
    CSV.foreach("products.csv","a+")do |line_csv|
     #each line of the csv file is push it in the array
      all_products << line_csv
    end
    #then to all_products a index is added
    all_products.each.with_index do |item, index|
      #each index is put at the begining at the item, an turn into a string
      item.unshift(index+1)
      selected = item if selected_input == index + 1
    end
    selected = "that number of item doesnt exist" if selected_input > all_products.length
    #delete money sign of price
    selected[2] = selected[2].delete "$"
    #turno price and quangtity into a strings
    selected[2] = selected[2].to_i
    selected[1] = selected[1].to_i
    selected
  end
  def arrange_inventory(product, newQuantity)
    #the CSV file is open with write capabilities
    CSV.open("products.csv","AQUI")do |line_csv|
      #the three instance varibles are put in a line of the csv file
      line_csv << [product.quantity, product.cost, product.name]
    end
    #to finish the index of product are shown with the new item included
    product_index
  end

end
#---------------------------
class Users#Father class for the Admin and Buyer users
  #at this point the "email" and the "password"
  attr_reader :email, :password
  def initialize(email=nil,password=nil)
    @email = email
    @password = password
  end
  #to add ner user to CSV file
  def add_user(email,password)#to parameters enter
    #the CSV file is open with write capabilities
    CSV.open("users.csv","a+")do |line_csv|
     #the email and password are added at the last line if the CSV file
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
    #then an index is aded in the array
    all_users.each.with_index do |item, index|
      #the index is put at the begining of the array and each element is turn into an string
      puts item.unshift( index+1 ).join " "
    end
  end
  #method used to itereate in the index of user and find if the correct email is input, but not showing the index
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
#class of the admin user, inherate all his methods, but has  only one value to email and password
class Admin < Users
    def initialize
      @email = "admin"
      @password = "123"
    end
end
#class for the buyer users, in wich the email and password are re-writable, and can't shown the index
class Buyer < Admin
  attr_accessor :email, :password
  private :user_index ,:user_index_no_visible
end
