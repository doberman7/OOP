class Controller

  def initialize(args)
    @argv_ary = args
    @view = View.new
    index
  end

  def index
    number_of_option = @argv_ary[0]
    if number_of_option == nil
      @view.welcome
      @view.index
      number_of_option = @view.input
    end
    case number_of_option
      when "" then index(number_of_option)
      when "1" then find_flight
      when "2" then admin_check
      when "3" then out
      else
        @view.error(0)
    end

  end
  #ticket returns returns the 'num_booking' or :ticket_canceled, plus [persons,total_cost]
  def ticket(fligth,num_of_passangers)
    ticket_result = @view.ticket(:create_tiket,fligth,num_of_passangers)
    #'@view.ticket' returns the num_booking or the symbol :ticket_canceled
    ticket_desicion = @view.ticket(:display_ticket,ticket_result,num_of_passangers)
    #the output of thos method resturn an array consisting
      #-ticket_desicion: num_booking
      #-ticket_result: [persons,total_cost]
    [ticket_desicion,ticket_result]
  end

  def booking(founded_plane)
    #mostrar detalles del vuelo
    @view.find_flight(founded_plane)
    #usuario seleccionar numero de pasasjers, el cual se asigna a una variable
    num_of_passangers = @view.booking(:chose_num_of_passengers)
    #convertir pasajeros en integer
    num_of_passangers = num_of_passangers.to_i
    #iterear en el obje ActiveRecord::Relation
    founded_plane.each do |flight_data|
      #si el numero de pasajers es menor al total de asientos disponibles
      if flight_data.passengers >= num_of_passangers
        #invocar metodo ticket
        ticket_ary = ticket(founded_plane,num_of_passangers)
        #ticket_ary is [ticket_desicion,ticket_result]
        # if ticket is not canceled...
        if ticket_ary[0] != :ticket_canceled
          num_booking = ticket_ary[0]
          total_cost = ticket_ary[1][1]
          #restar el numero de pasajeros en el avion
          flight_data.passengers = flight_data.passengers - num_of_passangers
          #AQUI
          #actulizar BD de vuelos
          p "1"
          founded_plane.update(flight_data.id, passengers: flight_data.passengers)
          p "2"
          p Booking.create!(flight_id: founded_plane.id, num_booking: num_booking, total: total_cost)

          @view.update(:booking_done)#=>"reservacion realizada"
        #id tiket is canceled users the metod 'find_flight' is invoked
        elsif ticket_ary[0] == :ticket_canceled
          find_flight
        end
      else
        @view.error(:not_enough_seets)
      end
    end
  end

  def find_flight
    @view.find_flight(:welocome_find_f)
    selected = @view.find_flight(:input)
    case selected
      when "1"
        @view.find_flight(:find_my_ticket)
        num_flight = @view.find_flight(:input)
        num_flight = num_flight.to_i
        founded_plane = Flight.where(num_flight: num_flight)
        #si ningun vuelo tiene ese numero de vuelo entonces muestra error, por el contrario si se encuentra el vuelo se inicia metodo de reservacion
        founded_plane.empty? ? @view.error(:no_flight_founded): booking(founded_plane);
        #----------
        find_flight
      when "2" then out
    end

  end

  def admin_check
    @view.admin(:welcome_adm)
    @view.admin(:ask_user)
    user_input_name = @view.admin(:admin_input)
    @view.admin(:ask_password)
    user_input_pass = @view.admin(:admin_input)
    #found the User where the user's name, input and admin=true converges
    admin_founded = User.where(name: user_input_name,password: user_input_pass,admin: true)
    # .empty? Returns true  if there are no records. its a methof from an ActiveRecord::Relation object
    #but if there are any records then....
    unless admin_founded.empty? == true
      admin_menu
      else @view.error(:invalid_user)
    end
  end

  def admin_menu
    @view.admin(:menu_admin)
    case @view.admin(:admin_input)
      when "1" then @view.admin(:view_all_flight)
        admin_menu
      when "2" then @view.admin(:view_all_bookings)
        admin_menu
      when "3" then add_flight
        admin_menu
      when "4" then @view.admin(:admin_goodbay)
        index
    end
  end

  def out
    @view.out
  end

  def add_flight
    @view.admin(:ask_num_flight)
    num_flight = @view.admin(:admin_input)
    num_flight = num_flight.to_i
    @view.admin(:ask_date)
    date = @view.admin(:admin_input)
    @view.admin(:ask_depart)
    depart = @view.admin(:admin_input)
    @view.admin(:ask_from)
    from = @view.admin(:admin_input)
    @view.admin(:ask_to)
    to = @view.admin(:admin_input)
    @view.admin(:ask_duration)
    duration = @view.admin(:admin_input)
    @view.admin(:ask_cost)
    cost = @view.admin(:admin_input)
    cost = cost.to_f
    @view.admin(:ask_passengers)
    passengers = @view.admin(:admin_input)
    passengers = passengers.to_i

    p Flight.create!(
      num_flight: num_flight, date: date, depart: depart, from: from, to: to, duration: duration, cost: cost, passengers: passengers
    )

    admin_menu
  end

  def delete
  end

  def complete
  end
end
