require_relative "store"
require_relative "view_store"

class Controller
  def initialize
    @products = Product.new
    @admin = Admin.new #CAMBIAR
    @buyer = Buyer.new
    @view = View.new
    @view.welcoming
    @input = gets.chomp
    menu(@input)
  end
  def menu(input)
    case input.to_i
      when 1 then login
      when 2 then p "Register"
      when 3 then p "Exit"
    end
  end
  def login
    @view.log_view(@input.to_i)
    log = nil
    until log == @admin.email
      log = gets.chomp
      @view.log_view(4) if log != @admin.email
    end
    @view.log_view(3)
    log = nil
    until log == @admin.password
      log = gets.chomp
      @view.log_view(5) if log != @admin.password
    end
    @view.log_view(2)
    @view.log_view(6)
  end

end
Controller.new
