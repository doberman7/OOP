
class View
  def welcoming
    puts "Welcome to the online store"
    puts "Select option number: \n1. Login\n2. Register\n3. Exit"
  end
  def log_view(input)
    case input
    when 1 then puts "Enter email, or \" menu\" to back"
      #when 2 then puts "or enter \"exit\" to go back "
      when 3 then puts "Enter pasword"
      when 4 then puts "Unknown email, try again,  or enter \"back\" to return one step forward"
      when 5 then puts "rong password, try again, or enter \"back\" to return one step forward"
      when 6 then puts "Welcome Administrador. Your type is Admin."
      #when 7 then puts "Welcome User."
      #when 8 then puts "Select option number:\n1. Logout\n2. Products index\n"
    end
  end
  def reg_view(input)
   case input
     when 1 then puts "Record  email"
     when 2 then puts "Record pasword"
     when 3 then puts "user added"
   end
  end
  def admin_view(input)
    case input
      when 0 then puts "Welcome Administrador. Your type is Admin\nSelect option number:\n1. Logout\n2. Products index\n3. Create product\n4. Users index"
      when 1 then puts "get back soon"
      when 2 then puts "This're the products we have"
    end
  end
  def buyer_view(input_buyer)
    case input_buyer
      when 1 then puts "Welcome User. Select option number:\n1. Logout\n2. Products index"

    end

  end
end
