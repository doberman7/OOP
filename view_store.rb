
class View
  def welcoming
    puts "Select option number: \n1. Login\n2. Register\n3. Exit"
  end
  def log_view(input)
    case input
    when 1 then puts "ingresa correo"
    when 2 then puts "ingresa ..."
    when 3 then puts "ingresa pasword"
    when 4 then puts "correo desconocido"
    end
  end

end
