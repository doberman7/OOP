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
      else
        @view.error(0)
    end

  end

  def booking
    p 'booking'
  end

  def admin
    @view.admin(0)#=> welcom admin
    @view.admin(1)#=> insert user
    argv_content = @argv_ary.any?
    if argv_content==false
      admin_contra = gets.chomp
      p admin_contra
    end
    @view.admin(2)#=> insert contra
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
