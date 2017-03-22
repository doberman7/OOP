class DummyClass

    def self.class_method
            puts "Dentro de un método de clase"
        puts "En este contexto self es igual a: #{self}"
    end
end

dummy_class = DummyClass.new()
puts DummyClass.class_method

#self hace referencia al contexto en el cual se encuentra, ya sea el metodo, el main, o bien un sting dentro de un objeto(en el cual leeeremos el ID del objeto)
