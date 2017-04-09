require_relative "model_store"#requerir modelo de la tienda, donde se encuetran las clases y los metodos
require_relative "view_store"#requerir Vistas de la tienda

class Store
  #the instance variables of the objetc Store are objets too
  def initialize
    @product = Product.new
    @admin = Admin.new
    @buyer = Buyer.new
    @view = View.new
    # @view.welcoming # we show the welcoming and menu options, in the future this could be changeed inside the method
    # @input = gets.chomp # selec the menu option
    # menu(@input)#the menu method is invoked
    sell
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
    end
  end
  #menu from a buyer user
  def sell
    input_sell = "n"
    selected = nil
    while input_sell == "n" || input_sell == "N"
      puts "selec article number"
      selected = @product.select_article
      puts "select quantity"
      quantity = gets.to_i
      puts "your request is: \n#{quantity} #{selected[3]}\'s\n is that ok?\n enter \"n\" if you want to try again or push any key to continue with the operation"
      input_sell = gets.chomp
    end#aqui
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
        @product.product_index
        sell
    end

  end

end
Store.new
#FALTA
#agregar user vededor, que puede agregar products
#que el comprador pueda comprar
#que el admin pueda borrar users y products
