require_relative "model"
require_relative "view"

class Controller
  def initialize(input)
    @input = input[1..-1]* " "
    @model = Record.new
    @view = View.new
    menu(input)#se activa el metodo menu
  end

  def menu(input)
    index if input == ["index"]#index esta dentro de un arreglo porque es el resultado de ARGV, un arreglo con lo ingresao en la consola
    add_console_comand if input.include?("add") #añadir comando add al menu para activar el metodo index
    delete if input.include?("delete")
  end

  def index
    tasks = @model.index
    @view.show(tasks)
  end
  def add_console_comand
    @model.add(Task.new(@input)) #asignar un nuevo objeto record a a la varClass model
    @view.messages(@input, "added")
  end
  def delete
    @model.delete(@input)

  end
end

input = ARGV
Controller.new(input)
