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

	def error
	end
end
