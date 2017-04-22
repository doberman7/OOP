class Athlete
  $records=0
  attr_accessor :distancia, :tiempo, :velozidad
  def initialize(distancia=0,tiempo=0)
    @distancia = distancia
    @tiempo = tiempo
    total_distance(distancia)
    total_time(tiempo)
    speed(distancia,tiempo)
  end
  #método para validar tiempo
  def total_distance(distancia=0)
    @distancia=@distancia+distancia
    @distancia
  end

  #método para hacer ejercicio
  def new_workout(distancia,tiempo)
     total_distance(distancia)
     total_time(tiempo)
     speed(distancia,tiempo)
  end
  def decimals(velozidad)
    num = 0
    while(velozidad != velozidad.to_i)
        num += 1
        velozidad *= 10
    end
    num
  end
  #método para obtener velocidad del atleta
  def speed(distancia,tiempo)
    if distancia!=0 && tiempo!=0
      @velozidad=distancia.to_f/tiempo.to_f
      @velozidad= "%.2f" % [@velozidad]
      #AQUI
      p decimals(@velozidad.to_f)
    else
      @velozidad=0
    end
  end
  def speed_record
    @velozidad
  end
  def total_time(tiempo=0)
    @tiempo=@tiempo+tiempo
  end
  def run
    "Ran #{total_distance} meters, time: #{total_time} seconds, speed: #{speed_record} m/s"
  end
  def swim
    "Swam #{total_distance} meters, time: #{total_time} seconds, speed: #{speed_record} m/s"
  end
  def ride_bike
    "ride #{total_distance} meters, time: #{total_time} seconds, speed: #{speed_record} m/s"
  end
end

#Runner class
class Runner<Athlete
  private :swim, :ride_bike
end

#Swimmer class
class Swimmer<Athlete
  private :ride_bike, :run
end
#Cyclist class
class Cyclist<Athlete
  private :run, :swim
end

#tests

#instancias de atletas con distancia en metros
runner = Runner.new()
swimmer = Swimmer.new(50, 10)
cyclist = Cyclist.new(70, 27)

#athletes = [runner, swimmer, cyclist]

# athletes.each do |athlete|
#   #¿qué tipo de atleta es?
#   puts "#{athlete.class} responds to:"
#   puts "\tAthlete speed: #{athlete.respond_to?(:speed) == true}"
#   puts "\tGet Athlete time: #{athlete.respond_to?(:total_time) == true}"
#   puts "\tSet Athlete time: #{athlete.respond_to?(:total_time) == true}"
#   puts "\tSpeed record: #{athlete.respond_to?(:speed_record) == true}"
#   puts "\tGet Distance: #{athlete.respond_to?(:total_distance) == true}"
#   puts "\tSet Distance: #{athlete.respond_to?(:total_distance) == true}"
#   puts "\trun method: #{athlete.respond_to?(:run) == true}" if athlete == runner
#   puts "\tswim method: #{athlete.respond_to?(:swim) == true}" if athlete == swimmer
#   puts "\tride_bike method: #{athlete.respond_to?(:ride_bike) == true}" if athlete == cyclist
#   puts "\n\n"
# end

#test for runner

#test para runner con distancia = 0
p runner.run #== "Ran 0 meters, time: 0 seconds, speed: 0 m/s"
#test para runner al hacer ejercicio, incrementa distancia = 20 metros y tiempo = 7 segundos
runner.new_workout(20, 7)
#test para runner con distancia = 20 metros y tiempo = 7 segundos
p runner.run #== "Ran 20 meters, time: 7 seconds, speed: 2.86 m/s"
#test para swimmer con distancia = 50
p swimmer.swim #== "Swam 50 meters, time: 10 seconds, speed: 5.0 m/s"
