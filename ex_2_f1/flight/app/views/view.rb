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
    puts 'Selecciona opcion:'
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
      when :welcome_adm then puts "Bienvenido Administrador \n#{"-"*30}"
      when :ask_user then puts "Ingrese usuario:"
      when :ask_password then puts "Ingrese contrasena:"
        #use STDIN.gets.chomp cuz 'gets.chomp' throws an error:  #http://stackoverflow.com/questions/27453569/using-gets-gives-no-such-file-or-directory-error-when-i-pass-arguments-to-my/27453657
      when :admin_input then STDIN.gets.chomp
      when :menu_admin
        puts 'Menu Administrador'
        puts '-' * 30
        puts '1) Muestra todos los vuelos'
        puts '2) Muestra todas las reservaciones'
        puts '3) Crea un nuevo vuelo'
        puts '4) Salir'
        puts 'Selecciona opcion:'
      when :admin_goodbay then puts 'adios'
      when :view_all_flight then  Flight.all.each do |f|
        p f
      end
      when :view_all_bookings then Booking.all.each do |b|
        p b
      end
      when :ask_num_flight then puts 'ingresa numero de vuelo'
      when :ask_date then 'ingresa fecha'
      when :ask_depart then 'ingresa fecha de salida'
      when :ask_from then 'ingresa origen de vuelo'
      when :ask_to then 'ingresa destino de vuelo'
      when :ask_duration then 'ingresa duracion de vuelo'
      when :ask_cost then 'ingresa costo'
      when :ask_passengers then 'ingresa pajeros'
    end
  end
end
