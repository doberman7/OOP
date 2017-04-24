require "faker"

#RaceCar class
class RaceCar
  LAP_DISTANCE = 100
  LAP_TIME = 5
  attr_reader :speed, :name, :time, :speeds, :times
  def initialize(name)
    @name = name
    @speed = 0
    #@time = 0
    @speeds=[]
    #@times=[]
    run(LAP_TIME)
    @average_s = average_speed
    speed_level(@average_s.to_i)
  end

  #método para obtener velocidad promedio
  def run(times)
    for @speed in 1..times
      @speed = rand(10..90)
      @speeds << @speed
    end
  end
  def average_speed
    @speeds.inject { |sum_speds, speed| sum_speds + speed}.to_f / @speeds.size
  end

  #método que muestra nivel de cada race car
  def speed_level(average_speed)
    case average_speed
      when 10...40 then "Principiante"
      when 41..50 then "Normal"
      when 51..70 then "Medio"
      when 71..90 then "Avanzado"
    end
  end
end

#Team class
class Team
  attr_accessor :cars
  def initialize(cars)
    @cars = cars
  end

  #método para agregar nuevo race car
  def add_carr
     @cars<<RaceCar.new("Power")
  end

  #método para calcular promedio de velocidad del equipo
  def average_speed_of_team

  end

end

#método para buscar race car
def search(name, team)
  #AQUI como iterar en el objeto team????
  team

end

#método para generar la tabla
def make_table

end

#método para mostrar nombre y nivel del race car
def display_name_and_level

end


#instancias de RaceCar
car1=RaceCar.new("uno")
car2=RaceCar.new("dos")
car3=RaceCar.new("tres")
car4=RaceCar.new("cuatro")
car5=RaceCar.new("cinco")
car6=RaceCar.new("seis")
#tests

p "car1: #{car1.average_speed} m/s"
#ej. car1: 9.5 m/s
p "car2: #{car2.average_speed} m/s"
#ej. car2: 12.01 m/s
p "car3: #{car3.average_speed} m/s"
#ej. car3: 10.65 m/s
p "car4: #{car4.average_speed} m/s"
#ej. car4: 11.0 m/s
p "car5: #{car5.average_speed} m/s"
#ej. car5: 10.15 m/s
p "car6: #{car6.average_speed} m/s"
#ej. car6: 15.51 m/s

#create a team of cars
team1 = [car1, car2, car3, car4, car5]
team_one = Team.new(team1)
team_one.add_carr
#test para buscar race car en equipo team_one
p search("Power", team_one) #== "Power is a racer"

#calculate average speed of team
#p team_one.average_speed_of_team
#ej. 10.66

#método para mostrar nombre y nivel del race car
