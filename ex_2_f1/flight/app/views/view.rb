class View
	# Recuerda que la única responsabilidad de la vista es desplegar data al usuario
  # Los siguientes métodos son sólo un ejemplo:
  def welcome
    puts 'Bienvenido a Vuelos Codea'
  end
	def index
    puts '-' * 35
    puts '1) Reservaciones'
    puts '2) Administrador'
    puts '3) Salir'
    puts 'Selecciona opción:'
	end

  def create
  end

  def delete
  end

  def update
  end

	def error(number_of_error)
    case number_of_error
    when 0 then puts 'that option doesnt exist'

    end
	end
  def admin(admin_option)
    case admin_option
    when 0 then puts "Bienvenido Administrador \n#{"-"*30}"
    when 1 then puts "Ingrese usuario:"
    when 2 then puts "Ingrese contraseña:"
    end
  end
end
