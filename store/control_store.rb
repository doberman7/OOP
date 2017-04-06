require_relative "model_store"#requerir modelo de la tienda, donde se encuetran las clases y los metodos
require_relative "view_store"#requerir Vistas de la tienda
$log_result = nil
class Controller
  def initialize
    @products = Product.new
    @admin = Admin.new
    @buyer = Buyer.new
    @view = View.new
    @view.welcoming
    @input = gets.chomp
    menu(@input)
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

      @view.log_view(@input.to_i)
      log = gets.chomp
      case
        when log == @admin.email
          @view.log_view(3)
          until log == @admin.password
            log = gets.chomp
            break if log == "exit"
            @view.log_view(5) if log != @admin.password #|| log != "exit"
          end
          if log != "exit" || log == @admin.password
            @view.log_view(6)
            log = :true_admin
          end
        when log != @admin.email
          all_users = @admin.user_index
          all_users.each do |user_data|
            if user_data[1] == log#SI el email del arreglo == al input
              @view.log_view(7) #welcomin user
              until log == user_data[2]#AQUI
                @view.log_view(3) #password
                log = gets.chomp
                if log == user_data[2]#input == password
                  log = :true_user
                end
              end
            end
          end
      end#end of case
    end#end of until
    $log_result = log
  end
  def register
    @view.reg_view(@input.to_i)
    @buyer.email = gets.chomp
    @view.reg_view(3)
    @buyer.password = gets.chomp
    @buyer.add_user(@buyer.email,@buyer.password)
    @view.reg_view(4)
  end

end
Controller.new
