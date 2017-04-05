=begin
Fíjate en las siguientes clases, trata de relacionarlas y crea los métodos para hacer pasar el driver code. Pon antención en el método que te pedimos en la clase 'Vehicle' el cual hará uso de la "Self keyword" que vimos anteriormente.
=end
class Vehicle
	attr_reader :color, :age, :number_of_wheels#atributos de lectura compartidos por todos los vehiculos, no necesitan initialize

	def initialize
		@age = 10#age aqui es una variable de instancia
	end

  def what_am_i?
		self.class#el class permite que la clase sea devuelta tal cual ej: "Skateboard" en lugar de con el id del objeto "#<Skateboard:0x007fbf750f0050"
    # Este método va a ser utilizado por varias clases y deberá regresar
    # el nombre de la clase desde la cual se corrió.
    # ej.
    # bocho = Car.new
    # bocho.what_am_i? => Car
  end

	def age!#aqui age! es un metodo
		true
	end
end
class Motorized < Vehicle
	attr_reader :has_motor, :tank_size, :refuel #atributos de lectura compartidos sòlo por los motorizados
end

class Motorbike < Motorized

end

class Car < Motorized

end

class Bicycle < Vehicle
	attr_writer :number_of_gears #
	def initialize(number_of_gears)#initializar el atributo edad de las clases biclieta
		@number_of_gears = number_of_gears# en el returno no se verà el numero de grars porque en: respond_to?(:number_of_gears) sòlo se pregunta la la instancia responde al atributo, no pues, leer el valor del atributo
		@age = 5
	end
end

class Skateboard < Vehicle
end

moto = Motorbike.new
car = Car.new
bike = Bicycle.new(8)
skateboard = Skateboard.new

vehicles = [moto, car, bike, skateboard]

#p moto.what_am_i?
vehicles.each do |vehicle|
  vehicle.age!
  puts "#{vehicle.what_am_i?} responds to:"
  puts "\tNumber of wheels: #{vehicle.respond_to?(:number_of_wheels) == true}"
  puts "\tColor: #{vehicle.respond_to?(:color) == true}"
  puts "\tAge!: #{vehicle.respond_to?(:age!) == true}"
  puts "\tHas motor: #{vehicle.respond_to?(:has_motor) == true}"
  puts "\tTank size: #{vehicle.respond_to?(:tank_size) == true}"
  puts "\tRefuel: #{vehicle.respond_to?(:refuel) == true}"
  puts "\tNumber of gears: #{vehicle.respond_to?(:number_of_gears) == true}"
  puts "\tAge: #{vehicle.age}"
  puts "\n\n"
end
