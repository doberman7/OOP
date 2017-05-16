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
      number_of_option = gets.chomp
    end
    case number_of_option
      when "" then index(number_of_option)
      when "1" then booking
      when "2" then admin
      when "3" then out
      else "not valid"
    end

  end

  def booking
    p 'booking'
  end
  def admin
    p 'admin'
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
