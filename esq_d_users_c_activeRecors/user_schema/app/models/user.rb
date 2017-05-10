class User < ActiveRecord::Base
# Implementa los métodos y validaciones de tu modelo aquí.
  def name
    name =  "#{self.first_name} #{self.last_name}"
    name
  end
  def age
    age = Date.today.year - self.birthday.year
    age
  end
end
