
#RaceCar class
class RaceCar
  LAP_DISTANCE = 100
  LAP_TIME = 5
  attr_reader :speed, :name, :time, :average_s, :level
  def initialize(name)
    @name = name
    @speed = 0
    @times=[]
    run(LAP_TIME,LAP_DISTANCE)
    @average_s = average_speed
    @level = speed_level
  end

  #método para obtener velocidad promedio
  def run(lapTime,lapDistance)
    for @speed in 1..lapTime
      #la velozidad se metros sobre segundo
      @speed = rand(1..12)
      #El tiempo es distancia sobre velozidad
      @times << lapDistance/@speed
    end
  end
  def average_speed
    @times.inject { |sum_speds, speed| sum_speds + speed}.to_f / @times.size
  end

  #método que muestra nivel de cada race car
  def speed_level
    case @average_s.to_i
      when 0..10 then "Principiante"
      when 11..21 then "Normal"
      when 22..39 then "Medio"
      when 40..90 then "Avanzado"
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
  def add_carr(name_car)
     @cars<<RaceCar.new(name_car)
  end

  #método para calcular promedio de velocidad del equipo
  def average_speed_of_team
    speeds=[]
    average_s_of_t = 0
    @cars.each do |car|
       speeds<<car.average_speed
    end
    #al array speeds se injecta un variable para sumar las velozidades, posteriormente se divide entre el largo del array
     average_s_of_t=speeds.inject {|sum_of_speeds,speed| sum_of_speeds+speed}/speeds.length
     #hacer que la velozidad promedio del equipo se presente solo con 2 decimales
     average_s_of_t = "%.2f" % [average_s_of_t]
     "la velozidad promedio del equipo es #{average_s_of_t}"
  end
end

#método para buscar race car
def search(name, team)
   team.each do|car|
      name = "#{name} is a racer" if car.name == name
  end
   name
end

#método para generar la tabla
def make_table(car_name,speed)
  #agregar linea que divide los parrafos
  puts "-"*32
  #agregar espacios al nombre y velozidad del auto hasta que su longitud sea la deseada, 9 y 11 repectivamente
  car_name << " " until car_name.length >= 9
   speed << " " until speed.length >= 11
  #separar nombre y velozidad con un pipe
  puts "|" + " " * 5 + car_name + "|" + " " * 4 + speed + "|"
end

#método para mostrar nombre y nivel del race car
def display_name_and_level(team)
  #mostrar pupe seguido de 5 espacios + palabra + 5 espacios + pipe, repetir con la siguiente palabra
  puts "|"+ " " * 5 + "Name" + " " * 5 + "|" + " " * 5 + "Nivel" + " " * 5 + "|"
   #iterar en en el el equipo y hacer la table por cada auto
   team.each do |car|
      puts  make_table(car.name,car.speed_level)
  end
end


#instancias de RaceCar
car1=RaceCar.new("uno")
car2=RaceCar.new("dos")
car3=RaceCar.new("tres")
car4=RaceCar.new("cuatro")
car5=RaceCar.new("cinco")
car6=RaceCar.new("seis")#este no es parte del equipo 1
#tests
#ver el objeto y sis atributos
#  p car1
# # #metodo para ver la velozidad
#  p car1.speed_level
# # #METODO para calcular la velizdad promedio
#  p car1.average_speed
# # #VISUALIZAR atributo tiempos
#  p car1.times
# # #VISUALIZAR atributo velozidad
#  p car1.speed

 p "car1: #{car1.average_speed} m/s"
# #ej. car1: 9.5 m/s
 p "car2: #{car2.average_speed} m/s"
 #ej. car2: 12.01 m/s
 p "car3: #{car3.average_speed} m/s"
# #ej. car3: 10.65 m/s
 p "car4: #{car4.average_speed} m/s"
# #ej. car4: 11.0 m/s
 p "car5: #{car5.average_speed} m/s"
# #ej. car5: 10.15 m/s
 p "car6: #{car6.average_speed} m/s"
# #ej. car6: 15.51 m/s

#create a team of cars
team1 = [car1, car2, car3, car4, car5]
team_one = Team.new(team1)
team_one.add_carr("Power")
#test para buscar race car en equipo team_one
p search("Power", team1) == "Power is a racer"

#calculate average speed of team
p team_one.average_speed_of_team
#ej. 10.66

#método para mostrar nombre y nivel del race car
display_name_and_level(team1)
