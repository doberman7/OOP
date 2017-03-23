require 'csv'

class Task
  attr_reader :item
  def initialize(item)
    @item = item
  end
end

class List
#Paso 2: #Crea un archivo CSV donde enlistes una serie de tareas. Una por cada línea
  def add(task)
    CSV.open("list.csv", "a+") do |csv_line| # "a+" cada escritura se realiza al final del archivo
        csv_line << [task.item]
    end
  end
end
# list = List.new#Inicializar una lista vacía
# list.add(Task.new('Comprar chicles'))#Agregar una tarea a la lista
# list.add(Task.new('Comprar manzanas rojas'))
# list.add(Task.new('Lavar la ropa'))
class Record
  def index
  end

  def add
  end

  def complete
  end

  def delete
  end

end
