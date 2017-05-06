require_relative 'app'

def assert(truthy)
  raise "Tests failed" unless truthy
end

# Este es un ejemplo de como crear una prueba para el método 'create'.
#chef = Chef.create(first_name: "Eduardo", last_name: "Fernández", email:"eduardo@gmail.com", phone:"930-028-2908 x7555", birthday:Time.now)

#Si lees el método create este se compone de los métodos 'new' y 'save' por ello si 'create' funciona los otros dos también.

# Este es un ejemplo de una prueba para el método 'find'.
# Como en la linea pasada creamos al primer chef entonces podemos buscarlo con el id => 1
 chef = Chef.find(1)

# Estas son pruebas para el método '[ ]'
# Como sabemos que el chef que creamos se llama 'Eduardo' y apellida 'Fernandez', podemos escribir la siguiente comparación.
assert chef[:first_name] == 'Eduardo'
assert chef[:last_name] == 'Fernández'


# El siguiente paso es crear las pruebas de todos los métodos que aparecen en los archivos models/chef.rb y models/meal.rb (solamente de los métodos similares),
#chefs
#METODO .all
todos_los_chefs = Chef.all
assert todos_los_chefs.first[:id]=1
assert todos_los_chefs.first[:first_name]='Eduardo'

todas_las_comidas = Meal.all
assert todas_las_comidas.first[:id]==1
assert todas_las_comidas.first[:name]=="Chicken Burger"

#METODO CREATE
#crear la comida 91 y 92
  #creamos dos comidas iguales:
    #meal = Meal.create(name:"Sopa", chef_id:1 ,created_at:Time.now, updated_at:Time.now)
  #Actualizamos aquella con el id 92
  #meal = Meal.create(id:92, name:"Taco", chef_id:1 ,created_at:Time.now, updated_at:Time.now)
meal = Meal.find(91)
assert meal[:id]=91
assert meal[:name]=="Sopa"
#METODO WHERE
#self.where(query, *args)
#Chef.where("id",("id"=1))

puts "finished"
