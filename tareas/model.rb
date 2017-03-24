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
      array_line << line_csv  #convertir cada linea del CSV un objeto taskpara poderlo ver
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
    array_from_BD = []
    num = 0
    deleted = ""
    CSV.foreach("list.csv") do |line_csv|
      num+=1
      array_from_BD << line_csv if  num != delet_at.to_i
      deleted = line_csv if num == delet_at.to_i
    end
     CSV.open("list.csv", "wb")do |line_csv|
        array_from_BD.each.with_index do |new_data, index|
          line_csv << new_data
        end
     end
     p deleted#resolver el borrado
  end

end
# rec_inst = Record.new#agrgar a Controller
# rec_inst.add(Task.new('Comprar chiles'))#Agregar una tarea a la lista
