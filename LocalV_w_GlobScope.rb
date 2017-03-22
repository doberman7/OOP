$global_var = "This is a global variable"
CONSTANT = 3.1516
def get_global_var
  $global_var
end
def set_global_var=(value)
  $global_var = value
end
def get_constant
  CONSTANT
end
# def set_constant=(value)
#   CONSTANT = value
# end
class DummyClass
  # @@class_variable = "This is a class variable"
  # def initialize
  #   @instance_var = "this is my instance_var "
  # end
  def get_global_var
    $global_var
  end
  def set_global_var=(value)
    $global_var = value
  end
  def get_constant
    CONSTANT
  end
  # def sett_constant=(value)
  #   CONSTANT = value
  # end
  # Este es un getter
  def instance_var
    @instance_var
  end

# Este es un setter
  def instance_var=(value)#por convencion se les agrega el igual, para sobrenetender que el método sobreescribe una variable
    @instance_var = value
  end
  def class_variable
    @@class_variable
  end
  def class_variable=(value)
    @@class_variable = value
  end

end
dummy_1 = DummyClass.new
dummy_2 = DummyClass.new

#p set_constant = "123"
p get_constant
p get_global_var
p dummy_1.get_constant
p dummy_2.get_global_var

    # Puedes definir un setter para la constante? NO
    # Modifica el valor de la variable global dentro del alcance global
    # Llama los getters del alcance global de las dos variables
    # Crea una instancia de DummyClass guardándola como dummy_1
    # Llama los getters por medio de esta instancia de las dos variable
    # Modifica por medio de esta instancia la variable global y luego llama su getter global.
