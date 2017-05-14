class TasksView
	# Recuerda que la única responsabilidad de la vista es desplegar data al usuario

	def index(input)
		#p inpu
		input.each do |task|
			p "-"*100
			p task
			#p "#{task.id} #{task.name} #{ task.status}  #{task.created_at} #{task.updated_at}"
		end
	end

  def create(name_of_new_task)
		puts 'The last element in data base is: '
		#.last is part of the 'ActiveRecord::Base' model, tanks to Object Relational Mapping it is possible to see in consol the last record in the DB
		p Task.last
  end

  def delete(task_to_be_deleted)
		puts "This record has been deleted"
		p task_to_be_deleted
  end

  def update(task_to_be_updated)
		puts "This record has been completed"
		p task_to_be_updated
  end

	def error(number_of_the_error)
		case number_of_the_error
		when 0 then puts "that record doesnt exist"
		when 1 then puts "An name is need it to add to the data base"
		end
	end
end
