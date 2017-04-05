require 'csv'

class Task
  attr_reader :item
  attr_accessor :status
  def initialize(item)
    @item = item
    @status = nil
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
       line_csv << [newTask.item , newTask.status]
    end
  end

  def complete(num)
    array_from_BD = []
    num = num.to_i - 1 #extrañamente no fue necesario "to_i" en en la asignacion a "num"
    index.each.with_index do |item, index|
      item[1] = "X" if index == num.to_i
      array_from_BD  << item
    end
    CSV.open("list.csv", "w+")do |line_csv|
      array_from_BD.each do |item,status|
        line_csv << [item,status]
      end
    end
  end

  def delete(delet_at)
    array_from_BD = []
    num = 0
    deleted = nil
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
     deleted
  end
end
