require 'csv'

class Task
  attr_reader :item
  def initialize(item)
    @item = item
  end
end

class Record
  def index
    array_line = []
    CSV.foreach("list.csv") do |line_csv|
      line_csv.flatten!#cada linea viene en un arreglo, por ahora al ser solo un elemento por linea lo aplanamos
      array_line <<  line_csv  #convertir cada linea del CSV un objeto taskpara poderlo ver
    end
      array_line
  end

  def add(newTask)#anadir Obj Task al CVR
    CSV.open("list.csv", "a+")do |line_csv|
      line_csv << [newTask.item]
    end
  end

  def complete
  end

  def delete
  end

end
rec_inst = Record.new#agrgar a Controller
rec_inst.add(Task.new('Comprar chiles'))#Agregar una tarea a la lista
