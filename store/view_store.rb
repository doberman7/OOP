
class View
  def welcoming
    puts "Welcome to the online store: Crea tu playera, (www.crea-tu-playera.com)"
    puts "Select option number: \n1. Login\n2. Register\n3. Exit"
  end
  def log_view(input)
    case input
      when 1 then puts "Enter email"
      when 2 then puts "or enter \"exit\" to go back "
      when 3 then puts "Enter pasword"
      when 4 then puts "Unknown email, try again"
      when 5 then puts "rong password, try again, or enter \"exit\" to go back "
      when 6 then puts "Welcome Administrador. Your type is Admin."
      when 7 then puts "Welcome User."
      #when 8 then puts "Select option number:\n1. Logout\n2. Products index\n"
    end
  end
  def reg_view(imethod_namenput)
   case input
   when 2 then puts "Register Email"
   when 3 then puts "Register pasword"
   when 4 then puts "user added"
   end
  end
  def ind_view(input)

  end
end
