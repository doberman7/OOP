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

  def find_flight
    @view.find_flight(:welocome_find_f)
    selected = @view.find_flight(:input)
    case selected
      when "1"
        @view.find_flight(:find_my_ticket)
        num_flight = @view.find_flight(:input)
        num_flight = num_flight.to_i
        founded_plane = Flight.where(num_flight: num_flight)
        #si ningun vuelo tiene ese numero de vuelo entonces muestra error, por el contrario si se encuentra el vuelo el mismo es mostrado
        founded_plane.empty? ?   @view.error(:no_find_flight_founded): @view.find_flight(founded_plane);
        num_of_passangers = @view.find_flight(:chose_num_of_passengers)
        num_of_passangers = num_of_passangers.to_i
        #-AQUI
        # founded_plane.each do |plane_data|
        #   puts founded_plane.passengers > num_of_passangers
        # end
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
