class List
  def add(task)
     task
  end
end
class Task
  attr_reader :item
  def initialize(element_list)
    @element_list = element_list
  end
end
list = List.new#Inicializar una lista vacía
list.add(Task.new('Comprar chicles'))#Agregar una tarea a la lista

#Paso 2: Crear un archivo para que persista la información
