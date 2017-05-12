class User < ActiveRecord::Base
# Implementa los métodos y validaciones de tu modelo aquí.
#HELPERS
#the "format" validates the attributes’ values by testing whether they match a given regular expression, which is specified using the :with option.
#The :on option lets you specify when the validation should happen


#La dirección de email deberá contener una @
#y al menos un . ,
#con al menos un caracter antes de la @, un caracter entre la @ y el primer . y al menos dos caracteres después del . final.
#a@e.co
  validates :email, :format => {:with=> /\A([^@\s]+)(@{1})(.+)(\.{1,})(.{2,})\z/, :on=> :create}
  #alternativa hecha por mario /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i


  #Dos usuarios no deberán tener el mismo email, este debe de ser único.
  #Los usuarios deberán de ser mayores de edad.

  def name
    name =  "#{self.first_name} #{self.last_name}"
    name
  end
  def age
    age = Date.today.year - self.birthday.year
    age
  end
end
