
class View
  def welcoming
    puts "Welcome to the online store: Crea tu playera, (www.crea-tu-playera.com)"
    puts "Select option number: \n1. Login\n2. Register\n3. Exit"
  end
  def log_view(input)
    case input
      when 1 then puts "Enter email"
      when 2 then puts "Register Email"
      when 3 then puts "Enter pasword"
      when 4 then puts "Unknown email, try again"
      when 5 then puts "rong password , try again"
      when 6 then puts "Select option number:\n1. Logout\n2. Products index\n3. Create product\n4. Users index"
      when 7 then puts "Welcome Administrador. Your type is Admin."
    end
  end
end
