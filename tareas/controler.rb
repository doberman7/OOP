require_relative "model"
require_relative "view"

class Controller
  def initialize(input)
    p @input = input
    @model = Record.new
    @view = View.new
    menu(input)
  end


  def menu(input)
    index if input == "index"
  end

  def index
    tasks = @model.index
    @view.show(tasks)
  end
end

input = ARGV
Controller.new(input)