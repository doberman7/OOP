require_relative "model_store"
require_relative "view_store"

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
    @view.log_view(7)
    @view.log_view(6)
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
