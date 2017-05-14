#IMPORTANTE: para probar este archivo se usa ARGV, esto es, los argumentos de inicializacion son desde la consola

#-el objeto eTasksController.new' y los 'require_relative's' necesarios se hacen en:
  #todo.rb
    #el cual hace un 'require_relative' a 'application.rb'
class TasksController
  def initialize(args)
    #llamamos a los args, argv ya que es el array construido en 'todo.rb'
    @argv = args
    @view = TasksView.new
    transform_ARGVarray(@argv)
  end
  #Transformar el array generado por  ARGV en la activacion de un metodo
  def transform_ARGVarray(input)
    case
    when input.include?('index') then index
      when input.include?('add') then add
      when input.include?('delete') then delete
      when input.include?('complete') then  complete
    end
  end

  def index
    # TIP: Aquí debes de llamar al método del mismo nombre de @view
    #.all is part of the 'ActiveRecord::Base' model, tanks to Object Relational Mapping can be used in here
     @view.index(Task.all)
  end

  def add
    # IF the ARGV is nil then the error number 1 is shown
    @view.error(1) if @argv[1]==nil
    #ASSIGN the name to the created task with a name, nil it not acepted because the model validates the record
    name_of_new_task = Task.create(name: @argv[1])
    #the last records in the data base is shon
    @view.create(name_of_new_task)
  end

  def delete
    #ASSIGN to a variable the resut of:
      #-find the id, .find_by is part of the 'ActiveRecord::Base' model, tanks to Object Relational Mapping can be used in here
      #@argv is an array, an in the elemtn 1 is the "id", whiche is a string an need to bee turn into an integer
    task_to_be_deleted = Task.find_by(id: @argv[1].to_i)
    # if there is not an id like the one in the @argv then..
    if task_to_be_deleted!=nil
      #the task in the DB is destroy and shown in the console
       @view.delete(task_to_be_deleted.destroy)
    else
      #if there's not such an id the error number 0 is shown
      @view.error(0)
    end
  end

  def complete
    task_to_be_updated = Task.find_by(id: @argv[1].to_i)
    # if there is not an id like the one in the @argv then..
    if task_to_be_updated!=nil
      #the task in the DB is updated
      task_to_be_updated.update(status: true)
      #the task already updated is shown
      @view.update(task_to_be_updated)
    else
      #if there's not such an id the error number 0 is shown
      @view.error(0)
    end
  end
end
