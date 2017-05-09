require_relative 'app'

def assert(truthy)
  raise "Tests failed" unless truthy
end

# Este es un ejemplo de como crear una prueba para el método 'create'.
Chef.create(first_name: "Eduardo", last_name: "Fernández", email:"eduardo@gmail.com", phone:"930-028-2908 x7555", birthday:Time.now)

#Si lees el método create este se compone de los métodos 'new' y 'save' por ello si 'create' funciona los otros dos también.

# Este es un ejemplo de una prueba para el método 'find'.
# Como en la linea pasada creamos al primer chef entonces podemos buscarlo con el id => 1
chef = Chef.find(1)

# Estas son pruebas para el método '[ ]'
# Como sabemos que el chef que creamos se llama 'Eduardo' y apellida 'Fernandez', podemos escribir la siguiente comparación.
assert chef[:id] == 1
assert chef[:last_name] == 'Harvey'


# El siguiente paso es crear las pruebas de todos los métodos que aparecen en los archivos models/chef.rb y models/meal.rb (solamente de los métodos similares),

#ALL
todos_los_chefs = Chef.all
assert todos_los_chefs.first[:id]=1
assert todos_los_chefs.first[:first_name]='Harvey'
assert todos_los_chefs.last[:first_name]='Eduardo'

todas_las_comidas = Meal.all
assert todas_las_comidas.first[:id]==1
assert todas_las_comidas.first[:name]=="Chicken Burger"

#CREATE
Meal.create(name:"Sopa", chef_id:1 ,created_at:Time.now, updated_at:Time.now)

#FIND
meal = Meal.find(12)
assert meal[:id]==12
assert meal[:name]=="Fish Sandwich"

#UPDATE
Meal.create(id:194, name:"quesadilla de habas", chef_id:1 ,created_at:Time.now, updated_at:Time.now)
meal = Meal.find(194)
assert meal[:name]=="quesadilla de habas"


#METODO WHERE
#ASSIGNAR objeto chef con metodo ".where" con el parametro en forma de string que se convertirá en el query
chef=Chef.where("id=20")
#el metodo .where regresa un Array
#por ello aplicamos ".pop" para reasingar el ultimo elemento del Array, dado que solo hay un objeto en el Array
chef=chef.pop
assert chef[:id]==20

#objetener las comidas del chef con el id 4, ingresas en un ary
meals_chef4 = Meal.where("chef_id=4")
#revisar que toadas las comidas pertenezcan el al chef con id 4
meals_chef4.each do |m_e_a_l|
  assert m_e_a_l[:chef_id] == 4
end

puts "finished"
