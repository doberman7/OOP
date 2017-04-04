require_relative "store"
require_relative "view_store"

class Controller
  def initialize#(input)
    #@input = input
    @products = Product.new
    @user = User.new
    @view = View.new
    @view.welcoming
    @input = gets.chomp
    menu(@input)
  end
  def menu(input)
    case input.to_i
    when 1 then p login
    when 2 then p "Register"
    when 3 then p "Exit"
    end
  end
  def login
    @view.log_view(@input.to_i)
    @user = gets.chomp
    log = /admin@email.com/ =~ @user #log es 0 o nil, dependiendo delinput
    # until log == 0
    #
    # end
    log == 0 ? @view.log_view(3) : @view.log_view(4);


  end

end
Controller.new
