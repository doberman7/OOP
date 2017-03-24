class View

  def show(tasks)
    #mostrar tareas de acuerdo a formato
    num = 0
    tasks.each do |line|
      puts  "#{num+=1} #{line}"
    end
  end

  def messages(input, caso)
    puts "#{input} was #{caso}"
  end
end
