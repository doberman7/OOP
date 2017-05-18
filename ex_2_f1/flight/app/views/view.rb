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

  def ticket(ticket_case, flight_data,num_of_passangers)
    case ticket_case
    when :create_tiket
      tiket_result = nil
      persons = {}
      puts "-" * 50
      flight_data.each do |f|
        puts "Número de Vuelo Seleccionado: #{f.num_flight}"
        puts "-" * 50
        puts "Date: #{f.date}, Depart: #{f.depart}"
        puts "From: #{f.from}, To: #{f.to}, Duration: #{f.duration}, Precio: #{f.cost}"
        puts "-" * 50
        #El número de datos de persona dependerá del número de passengers.
        seets = num_of_passangers
        pers = 0
        until seets <=0
          puts "Datos de Persona #{pers+=1}:"
          puts "Ingresa nombre :"
          p_name = STDIN.gets.chomp
          puts  "Ingresa email:"
          #construir relacion de name: email en el hash
          persons[p_name] = STDIN.gets.chomp
          seets -= 1
        end
        total_cost = f.cost * persons.length
        tiket_result = [persons,total_cost]
      end
      tiket_result
    when :display_ticket
      persons = flight_data[0]
      total_cost=flight_data[1]
      puts "El costo total es de #{total_cost}"
      puts 'Realizar reservación: SI / NO'
      reservacion_input = STDIN.gets.chomp
      if reservacion_input == "SI" || reservacion_input == "si"
        puts "*"*50
        puts "Reservación correcta"
        puts "*"*50
        puts "El costo total es de #{total_cost}"
        num_booking = "#{rand(500)}-#{rand(9)}"
        puts "Y tu ID de reservación es la siguiente #{num_booking}"
        num_booking
      elsif reservacion_input == "NO" || reservacion_input == "no"        
        :ticket_canceled
      end
    end
  end

  def delete
  end

  def update(value_to_update)
    case value_to_update
      when :booking_done then puts 'reservacion realizada'

    end

  end

	def error(type_of_error)
    case type_of_error
      when 0 then puts 'that option doesnt exist'
      when :invalid_user then puts 'usuario no valido'
      when :no_flight_founded then puts 'ningun vuelo con ese numero'
      when :not_enough_seets then puts 'no suficientes asientos'
    end
	end
  def input
     STDIN.gets.chomp
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
      when :admin_goodbay then puts 'adios admin'
      when :view_all_flight then  Flight.all.each do |f|
        p f
      end
      when :view_all_bookings then Booking.all.each do |b|
        p b
      end
      when :ask_num_flight then puts 'ingresa numero de vuelo'
      when :ask_date then puts 'ingresa FECHA (aaaa-mm-dd)'
      when :ask_depart then puts 'ingresa hora de SALIDA (hh:mm:ss)'
      when :ask_from then puts 'ingresa ORIGEN de vuelo'
      when :ask_to then puts 'ingresa DESTINO de vuelo'
      when :ask_duration then puts 'ingresa DURACION de vuelo (hh:mm:ss)'
      when :ask_cost then puts 'ingresa COSTO (i.f)'
      when :ask_passengers then puts 'ingresa numero de pajeros'

    end
  end

  def find_flight(flight_data)
    case flight_data
      when :welocome_find_f
        puts "-" * 50
        puts '!!!Bienvenido!!!'
        puts "-" * 50
        puts "1) Encuentra tu boleto de avion"
        puts "2) Salir"
        puts "Selecciona una opcion:"
      when :input then STDIN.gets.chomp
      when :find_my_ticket
        Flight.all.each do |f|
          puts "Numero de Vuelo:#{f.num_flight}"
          puts "Fecha:#{f.date}"
          puts "Salida:#{f.depart}"
          puts "Origen:#{f.from}"
          puts "Destino:#{f.to}"
          puts "Duracion:#{f.duration}"
          puts "Costo:#{f.cost}"
          puts "Pasajeros:#{f.passengers}"
          puts "*" * 30
        end
        puts 'Selecciona tu numero vuelo:'

      else
        flight_data.each do |f|
          puts "Numero de Vuelo:#{f.num_flight}"
          puts "Fecha:#{f.date}"
          puts "Salida:#{f.depart}"
          puts "Origen:#{f.from}"
          puts "Destino:#{f.to}"
          puts "Duracion:#{f.duration}"
          puts "Costo:#{f.cost}"
          puts "Pasajeros:#{f.passengers}"
        end
    end
  end

  def booking(booking_case)
    case booking_case
    when :chose_num_of_passengers
      puts 'ingresa numero de pasajeros'
      STDIN.gets.chomp

    end
  end

  def out
    puts "adios"
  end
end
