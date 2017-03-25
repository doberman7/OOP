class View

  def show(tasks)
    #mostrar tareas de acuerdo a formato
    num = 0
    tasks.each do |task, status|
      puts "#{num+=1}. [#{status}] #{task}"
    end

  end

  def messages(input, caso)
    puts "#{input} was #{caso}"
  end
end
