require_relative "model_store"#requerir modelo de la tienda, donde se encuetran las clases y los metodos
require_relative "view_store"#requerir Vistas de la tienda

class Store
  #the instance variables of the objetc Store are objets too
  def initialize
    @product = Product.new
    @admin = Admin.new
    @buyer = Buyer.new
    @view = View.new
    display_welcoming_and_menu

  end
  def display_welcoming_and_menu
    @view.welcoming # we show the welcoming and menu options, in the future this could be changeed inside the method
    @input = gets.chomp # selec the menu option
    menu(@input)#the menu method is invoked
  end
  #metho to select options
  def menu(input)
    case input.to_i
    when 1 then login #invoke login method
    when 2 then register#invoke Register method
    when 3 then @view.goodBye#invoke goodBye method
    end
  end
  #invoke login menu and options
  def login
    log = nil#varible for input's
    #loop for detect administrator or buyer
    until log == :true_admin || log == :true_user
      @view.log_view(1)#"enter email"
      log = gets.chomp
        case
          #WHEN the administrator email is enter
          when log == @admin.email
            @view.log_view(3)#"Enter pasword"
            #UNTIL the rigth pasword is enter
            until log == @admin.password
              log = gets.chomp
              break if log == "back"
              #IF rong password, try again, or enter \"back\" to return one step forward
              @view.log_view(5) if log != @admin.password #|| log != "exit"
            end
            #IF the admin login is correct
            if log != "back" && log == @admin.password
              log = :true_admin #symbol that end the loop "until"
              menu_admin# method of menu of the administrator is invoked
            end
          when log == "menu"#WHEN the user input's "menu" the menu(input) method's invoke∫
          @view.welcoming
          @input = gets.chomp
          menu(@input)
        else
          #p "else"
          all_users = @admin.user_index_no_visible
          all_users.each do |user_data|
            if user_data[1] == log#SI un email del "user.csv" == al input
              @view.log_view(3) #  welcomin user
              until user_data[2] == log#LOOP until the input is equal to password of the  "user.csv"
                log = gets.chomp
                break if log == "back"#IF the input is "back" string, the loop is break
                @view.log_view(5) if user_data[2] != log# IF the password is rong ask for the password again
              end
              #IF the input is not "back" and the password is OK then the loop is end it, say hi to the user and  "menu_buyer" is invoke
              if log != "back" && log == user_data[2]
                log = :true_user
                @view.buyer_view(1)
                menu_buyer
              end
            end
          end
        end#end of if
    end#end of until
    #$log_result = log #log can be :true_user or :true_admin
  end#end of login method
  #method for add more user to the CSV file
  def register
    @view.reg_view(1)# aks to the user to input email
    @buyer.email = gets.chomp
    @view.reg_view(2)#ask the user to input password
    @buyer.password = gets.chomp
    #A buyer objetc is created and add_user method applied to it, two parameters ar inserted: email and password
    @buyer.add_user(@buyer.email,@buyer.password)
    @view.reg_view(3)#puts "user added"
    display_welcoming_and_menu
  end

  #MENU for the administrator
  def menu_admin
    @view.admin_view(0)#say hi to the admin and show his options
    input_admin = gets.to_i #input is turn into an integer
    case input_admin
      #option to logout
      when 1
        @view.welcoming
        @input = gets.chomp
        menu(@input)#the initial menu is shown
      #option product index
      when 2
        @view.admin_view(2)#productu index
        @product.product_index#to the Obj Product is
        puts "pres any key to continue"
        gets.chomp
        menu_admin#
      when 3
        @product.create_product(@product)#create product
        puts "pres any key to continue"
        gets.chomp
        menu_admin
      when 4
        @admin.user_index#user index
        puts "pres any key to continue"
        gets.chomp
        menu_admin#using recursion the munu method call himself
      when 5
        @admin.user_index#user index
        puts "select user to delete"
        delete_user
    end
  end
  def delete_user
    @admin.user_index
    @view.admin_deletin_message(1)
    @admin.deleter_of_users(user=gets.chomp)
    @view.admin_deletin_message(2)
    @admin.user_index
    @view.admin_deletin_message(3)
    input = gets.chomp
    if input == "y" || input == "Y"
      delete_user
    else
      menu_admin
    end
  end
  def select_article(all_products)
    selected = nil
    puts "selec article number"
    selected_input = gets.to_i
    while selected_input > all_products.length
      puts "that item doesnt exist"
      selected_input = gets.to_i
    end
    all_products.each do |product|
      selected = product if product[0] == selected_input
    end

    # #delete money sign of price
    selected[2] = selected[2].delete "$"
    #turn price and quangtity into a integers
    selected[2] = selected[2].to_i
    selected[1] = selected[1].to_i
    #WHILE there is no product in the inventory
    while selected[1] == 0
      puts "select an other one, to have exitance on inventory"
      selected = @product.select_article
    end
    #the product selected is shown
    puts "#{selected[3]} has been selected"
    puts "there is #{selected[1]} in existance"
    selected
  end
  #menu from a buyer user
  def sell
    all_products = @product.product_index
    input_sell = "r"
    selected = nil
    quantity = nil
    buy_cart = []
    total = 0
    #WHILE for the opction to selecte other kind of product and quantity
    while input_sell == "r" || input_sell == "R" || input_sell == "add"||input_sell == "ADD"
      selected = select_article(all_products)
      #PROBLEMA CON SELECTED
      #AQUI vamos
      puts "select quantity"
      #the quantity is obtain
      quantity = gets.chomp.to_i
      #WHILE the input is greater than the exitance in inventory, a new input is required
      while quantity > selected[1] || quantity <= 0
        puts "chooose a number between 1 and #{selected[1]}" if quantity <= 0
        puts "not enough in stock, tray again" if quantity > selected[1]
        quantity = gets.chomp.to_i
      end
      #the amount to pay is show for the quantity of products
      mount_to_pay = total_of_same_product_count(quantity,selected[2])
      puts "your request is: \n#{quantity} units of #{selected[3]}, that would be $#{mount_to_pay} enter:"
      puts " -\"r\" if you want to re-initiate your buy \n -\"add \" for add more articles in the buy-cart \n -any key to continue with the operation"
      #input_buyer determines if the loop for selecting product is re-initiated
      input_sell = gets.chomp
      buy_cart << [quantity,mount_to_pay,selected[3]] if input_sell == "add" || input_sell == "ADD" || input_sell != "r" || input_sell != "R" || input_sell == "\n"
    end
    puts "your buy car includes:"
    buy_cart.each do |product_in_cart|
      puts "-#{product_in_cart[0]} units of #{product_in_cart[2]} for $#{product_in_cart[1]} "
      total = total + product_in_cart[1].to_i
    end
    puts "thar would be a total of #{total}"
    input_sell = nil
    puts "if its that correct enter \"ok\" \nif you wana try again type \"no\""
    input_sell = gets.chomp
    case input_sell
      #WHEN inputu is  "no" the sell star's again
      when "no"
        sell
      #WHEN "ok" then the quantity of products in inventory is re-arrange
      when "ok"
        @product.arrange_inventory(buy_cart)
        @view.thanks(1)
    end

  end

  def total_of_same_product_count(quantity, cost)
    total_of_same_product = quantity * cost
    total_of_same_product
  end

  def menu_buyer
    @view.buyer_view(1)#say hi to buyer ans options are shown
    input_buyer = gets.to_i
    case input_buyer
      #go to the intial menu
      when 1
        @view.welcoming
        input = gets.chomp
        menu(input)
      #menu of products are shown
      when 2
        #@product.product_index
        sell
    end

  end

end
Store.new
#FALTA
#agregar user vededor, que puede agregar products

#que el admin pueda borrar users y products
