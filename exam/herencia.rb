#Super class, this inherate methods to the other class
class Athlete
  # the atibutes of tha class can be readit and write it
  attr_accessor :distancia, :tiempo, :velozidad
  #in case that the object has no initial atributes defualt values are 0
  def initialize(distancia=0,tiempo=0)
    #ASSUIGN values to the object
    @distancia = distancia
    @tiempo = tiempo
    #CALCULATE speed of the object
    speed(@distancia,@tiempo)
  end
  #método para validar tiempo
  def total_distance(distancia=0)
     @distancia=@distancia+distancia
  end

  #método para hacer ejercicio
  def new_workout(distancia,tiempo)
     total_distance(distancia)
     total_time(tiempo)
     speed(distancia,tiempo)
  end
  #method that determine the number of decimales to be shown, 1 or 2
  def decimals_or_floaters(number)
    number.to_i == number.to_f ? number= "%.1f" % [number] : number= "%.2f" % [number];
  end
  #método para obtener velocidad del atleta
  def speed(distancia,tiempo)
    # IF distancia and tiempo are not 0, this is because 0/0 throws an error
    if distancia!=0 && tiempo!=0
      @velozidad=distancia.to_f/tiempo.to_f
      @velozidad=decimals_or_floaters(@velozidad)
    else
      @velozidad=0
    end
  end
  #this methos only brigns the "velozidad" atribute
  def speed_record
    @velozidad
  end
  #ADD tiempo to the atribute @tiempo
  def total_time(tiempo=0)
    @tiempo=@tiempo+tiempo
  end
   #METHODS run, swim and ride, display answers
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
#inherate from athlete class exept ride_bike and run
class Swimmer<Athlete
  private :ride_bike, :run
end
#Cyclist class
#inherate from athlete class exept rub and swim
class Cyclist<Athlete
  private :run, :swim
end

#tests

#instancias de atletas con distancia en metros
runner = Runner.new()
swimmer = Swimmer.new(50, 10)
cyclist = Cyclist.new(70, 27)

athletes = [runner, swimmer, cyclist]

athletes.each do |athlete|
  #¿qué tipo de atleta es?
  puts "#{athlete.class} responds to:"
  puts "\tAthlete speed: #{athlete.respond_to?(:speed) == true}"
  puts "\tGet Athlete time: #{athlete.respond_to?(:total_time) == true}"
  puts "\tSet Athlete time: #{athlete.respond_to?(:total_time) == true}"
  puts "\tSpeed record: #{athlete.respond_to?(:speed_record) == true}"
  puts "\tGet Distance: #{athlete.respond_to?(:total_distance) == true}"
  puts "\tSet Distance: #{athlete.respond_to?(:total_distance) == true}"
  puts "\trun method: #{athlete.respond_to?(:run) == true}" if athlete == runner
  puts "\tswim method: #{athlete.respond_to?(:swim) == true}" if athlete == swimmer
  puts "\tride_bike method: #{athlete.respond_to?(:ride_bike) == true}" if athlete == cyclist
  puts "\n\n"
end

#test for runner

#test para runner con distancia = 0
p runner.run == "Ran 0 meters, time: 0 seconds, speed: 0 m/s"
#test para runner al hacer ejercicio, incrementa distancia = 20 metros y tiempo = 7 segundos
runner.new_workout(20, 7)
#test para runner con distancia = 20 metros y tiempo = 7 segundos
p runner.run == "Ran 20 meters, time: 7 seconds, speed: 2.86 m/s"
#test para swimmer con distancia = 50
p swimmer.swim == "Swam 50 meters, time: 10 seconds, speed: 5.0 m/s"
#test para cyclist con distancia = 70
p cyclist.ride_bike == "ride 70 meters, time: 27 seconds, speed: 2.59 m/s"
cyclist.new_workout(20, 3)
#test para cyclist al hacer ejercicio, incrementa distancia = 20 metros y tiempo = 3 segundos
p cyclist.ride_bike == "ride 90 meters, time: 30 seconds, speed: 6.67 m/s"
