require_relative "model"
require_relative "view"

class Controller
  def initialize(input)
    @input = input
    @model = Record.new
    @view = View.new
    menu(input)#se activa el metodo menu
  end


  def menu(input)
    index if input == ["index"]#index esta dentro de un arreglo porque es el resultado de ARGV, un arreglo con lo ingresao en la consola
    #añadir comando add al menu para activar el metodo index
  end

  def index
    tasks = @model.index
    @view.show(tasks)
  end
  def add_console_comand
    #asignar un nuevo objeto record a a la varClass model
  end
end

input = ARGV
Controller.new(input)
