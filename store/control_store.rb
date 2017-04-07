require_relative "model_store"#requerir modelo de la tienda, donde se encuetran las clases y los metodos
require_relative "view_store"#requerir Vistas de la tienda
$log_result = nil
class Controller
  def initialize
    @product = Product.new
    @admin = Admin.new
    @buyer = Buyer.new
    @view = View.new
    @view.welcoming
    @input = gets.chomp
    menu(@input)
    #menu_admin#SOLO PARA PRUEBAS
  end
  def menu(input)
    case input.to_i
      when 1 then login
      when 2 then register
      when 3 then p "Exit"
    end
  end
  def login
    log = nil
    until log == :true_admin || log == :true_user

      @view.log_view(@input.to_i)#"enter email"
      log = gets.chomp
        case
        when log == @admin.email
          @view.log_view(3)
          until log == @admin.password
            log = gets.chomp
            break if log == "exit"
            @view.log_view(5) if log != @admin.password #|| log != "exit"
          end
          if log != "exit" && log == @admin.password
            log = :true_admin
            menu_admin
          end
        when log == "menu"
          @view.welcoming
          @input = gets.chomp
          menu(@input)
        else
          all_users = @admin.user_index
          all_users.each do |user_data|
            if user_data[1] == log#SI el email del arreglo == al input
              @view.log_view(7) #welcomin user
              @view.log_view(3)
              until user_data[2] == log
                log = gets.chomp
                break if log == "exit"
                @view.log_view(5) if user_data[2] != log
              end
              if log != "exit" && log == user_data[2]
                @view.log_view(7)
                log = :true_user
              end
            end
          end
        end#end of if
    end#end of until
    $log_result = log #log can be :true_user or :true_admin
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
    @view.admin_view(0)
    input_admin = gets.to_i
    case input_admin
      when 1
        @view.admin_view(1)
      when 2
        @view.admin_view(2)
        @product.product_index.each
      when 3
        @product.create_product(@product)
      when 4
        @admin.user_index
    end
  end

end
Controller.new
