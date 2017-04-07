require_relative "model_store"#requerir modelo de la tienda, donde se encuetran las clases y los metodos
require_relative "view_store"#requerir Vistas de la tienda

class Store
  #the instance variables of the objetc Store are objets too
  def initialize
    @product = Product.new
    @admin = Admin.new
    @buyer = Buyer.new
    @view = View.new
    @view.welcoming # we show the welcoming and menu options, in the future this could be changeed inside the method
    @input = gets.chomp # selec the menu option
    menu(@input)#the menu method is invoked
  end
  def menu(input)
    case input.to_i
      when 1 then login
      when 2 then register
      when 3 then puts "See ya"
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
          when log == "menu"
          @view.welcoming
          @input = gets.chomp
          menu(@input)
        else
          p "else"
          all_users = @admin.user_index_no_visible
          all_users.each do |user_data|
            if user_data[1] == log#SI el email del arreglo == al input
              @view.log_view(7) #welcomin user
              @view.log_view(3)
              until user_data[2] == log
                log = gets.chomp
                break if log == "back"
                @view.log_view(5) if user_data[2] != log# IF the password is rong
              end
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
  def register
    @view.reg_view(1)
    @buyer.email = gets.chomp
    @view.reg_view(2)
    @buyer.password = gets.chomp
    @buyer.add_user(@buyer.email,@buyer.password)
    @view.reg_view(3)
  end
  def menu_admin
    counter_welcoming = 0
    @view.admin_view(0) if counter_welcoming <=1
    input_admin = gets.to_i
    case input_admin
      when 1
        counter_welcoming +=1
        @view.welcoming
        @input = gets.chomp
        menu(@input)
      when 2
        counter_welcoming +=1
        @view.admin_view(2)#productu index
        @product.product_index#to the Obj Product is
        puts "pres any key to continue"
        gets.chomp
        menu_admin
      when 3
        counter_welcoming +=1
        @product.create_product(@product)#create product
        puts "pres any key to continue"
        gets.chomp
        menu_admin
      when 4
        counter_welcoming +=1
        @admin.user_index#user index
        puts "pres any key to continue"
        gets.chomp
        menu_admin
    end
  end
  def menu_buyer
    @view.buyer_view(1)
    input_buyer = gets.to_i
    case input_buyer
    when 1
      @view.welcoming
      input = gets.chomp
      menu(input)
    when 2
      @product.product_index
      puts "press any key to continue"
      gets
      menu_buyer
    end
  end

end
Store.new
