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
      array_line << line_csv.join  #convertir cada linea del CSV un objeto taskpara poderlo ver
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

  def delete(delet_at)
    array_line = []
    num = 0
    CSV.foreach("list.csv") do |line_csv|
      num+=1
      array_line << [num,line_csv.join]  #convertir cada linea del CSV un objeto taskpara poderlo ver
    end
      array_line.each do |element|
        #p element.include?(input) AQUI encontrar numero
      end
  end

end
# rec_inst = Record.new#agrgar a Controller
# rec_inst.add(Task.new('Comprar chiles'))#Agregar una tarea a la lista
