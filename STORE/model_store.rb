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

    puts "# Quantity    Cost       Name"
    #then to all_products a index is added

    all_products.each.with_index do |item, index|
      #print a line to divide each paragraph
      puts "-----------------------------------"
      #assign an array to put the item caracteriztics
      caracteriztics = []
      #analize each item call in it "c"
      item.each do |c|
        #add a space to "c" until "c" size is equal or greater than 9
        until c.size >= 9
          c << " "
        end
        #push c into the array "caracteriztics"
        caracteriztics << c
      end
      #print the index at the begining of the paragraph with and space
      #the "index+1" it's because the index star's at 0
      puts caracteriztics.unshift( index+1 ).join"  "
    end
  end
  def product_index_invisble
    all_products = []
    CSV.foreach("products.csv","a+")do |line_csv|
     #each line of the csv file is push it in the array
      all_products << line_csv
    end
    all_products.each.with_index do |item, index|
      item.unshift( index+1 )
    end
    all_products
  end
  #return the selected_input or "not founded in CSV file"
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
  def arrange_inventory(buy_cart)
    #buy_cart is: [quantity,cost,name] of varios products
    #all_products is: [quantity, price, name] of varios products
    all_products = []
    CSV.foreach("products.csv","a+")do |line_csv|
     #each line of the csv file is push it in the array
       all_products << line_csv
    end
    #extract the product in the cart to the array that copy the CSV file
    all_products.each do |product_in_storage|
      buy_cart.each do |product_in_cart|
        if product_in_storage[2] == product_in_cart[2]
          product_in_storage[0] = product_in_storage[0].to_i - product_in_cart[0].to_i
        end
      end
    end
    CSV.open("products.csv","w+")do |line_csv|
      all_products.each do |product_in_storage|
        line_csv << product_in_storage
      end
    end
  end
  def delete_article_in_csv(selected)
    all_products = []
    CSV.foreach("products.csv","a+") do |line_csv|
      all_products << line_csv
    end


    CSV.open("products.csv","w+") do |line_csv|
      all_products.each.with_index do |product, index|
        #puts "#{selected[0]} != #{index + 1}"
        line_csv << product unless selected[0] == index + 1
      end
    end
  end
end
#---------------------------
class SuperUser#Father class for the Admin and Buyer users
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
    puts "# EMAIL        PASSWORD"
    #then an index is aded in the array
    all_users.each.with_index do |item, index|
      # a line to divide each paragraph
      puts "-----------------------------"
      #assign an array to put each caracteriztic of the user an printed later in the paragraph
      user = []
      #analize the item to add spaces betwen the caracteriztics
      item.each do |usr|
        #until the size of the string a.k.a. caracteriztic is equal or greater than 13 an space is added
        until usr.size >=13
          usr << " "
        end
        #the caracteriztic of the user us pushed in the "user array" with the spaces already added
        user << usr
      end
      #print ech user array with a numeration at the begining
      puts user.unshift( index+1 ).join " "
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
  def deleter_of_users(user)
    #user_to_delete = gets.chomp
    all_users = []
    CSV.foreach("users.csv","a+")do |line_csv|
     #each line of the csv file is push it in the array
       all_users << line_csv
    end
    CSV.open("users.csv","w+")do |line_csv|
      all_users.each.with_index do |user_in_csv, index|
        #IF the input containing the user is diferent the user is re_writen in the CSV file
        line_csv << user_in_csv if index+1 != user.to_i
      end
    end
  end
end
#-------------------------
#class of the admin user, inherate all his methods, but has  only one value to email and password
class Admin < SuperUser
    def initialize
      @email = "admin"
      @password = "123"
    end
end
#class for the buyer users, in wich the email and password are re-writable, and can't shown the index
class Buyer < Admin
  attr_accessor :email, :password
  private :user_index ,:user_index_no_visible, :deleter_of_users
end
class Seller < SuperUser
  private :user_index ,:user_index_no_visible, :deleter_of_users
end
