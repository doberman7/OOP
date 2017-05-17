class Controller

  def initialize(args)
    @argv_ary = args
    @view = View.new
    index(@argv_ary)
  end


  def index(argv)
    number_of_option = argv[0]
    if number_of_option == nil
      @view.welcome
      @view.index
      number_of_option = @view.admin(:user_unput)
    end
    case number_of_option
      when "" then index(number_of_option)
      when "1" then booking
      when "2" then admin
      when "3" then out
      else
        @view.error(0)
    end

  end

  def booking
    p 'booking'
  end
  def admin
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
      @view.admin(:menu_admin)
      case @view.admin(:admin_input)
        when "1" then @view.admin(:view_all_flight)
        when "2" then @view.admin(:view_all_bookings)
        when "3" then
          @view.admin(:ask_num_flight)
          num_flight = @view.admin(:admin_input)
          @view.admin(:ask_date)
          date = @view.admin(:admin_input)
          depart = @view.admin(:admin_input)
          from = @view.admin(:admin_input)
          to = @view.admin(:admin_input)
          duration = @view.admin(:admin_input)
          cost = @view.admin(:admin_input)
          passengers = @view.admin(:admin_input)

          Flight.create(
          num_flight: num_flight, date: date, depart: depart, from: from, to: to, duration: duration, cost: cost, passengers: passengers
          )
        when "4" then @view.admin(:admin_goodbay)
      end
    end

  end


  def out
    p 'out'
  end
  def add

  end

  def delete
  end

  def complete
  end
end
