class User < ActiveRecord::Base
# Implementa los métodos y validaciones de tu modelo aquí.
#HELPERS
#the "format" validates the attributes’ values by testing whether they match a given regular expression, which is specified using the :with option.
#The :on option lets you specify when the validation should happen


#La dirección de email deberá
    #-contener una @
    #-al menos un .
    #-con al menos un caracter antes de la @, un caracter entre la @ y el primer . y al menos dos caracteres después del . final.
  validates :email, :format => {:with=> /\A([^@\s]+)(@{1})(.+)(\.{1,})(.{2,})\z/, :on=> :create}
  #OTRA OPCION de regexp:
    # /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
    #http://guides.rubyonrails.org/v3.2.13/active_record_validations_callbacks.html#performing-custom-validations
    #en 6.1 Custom Validators
    #que es la misma implementaciond de mario: https://github.com/Alux77/DB-7/blob/master/app/models/user.rb

  #Dos usuarios no deberán tener el mismo email, este debe de ser único.
  #validates es pàra atributos
  validates :email , uniqueness: true

  #Los usuarios deberán de ser mayores de edad.
  #before_validation :not_a_kid?
  #validate es para llamar metodos
    validate :not_a_kid?

  #validación personalizada donde el teléfono no pueda tener menos de 10 dígitos sin contar caracteres no numéricos.
  #funciona, pero contempla todos los string's, no solo numeros
  validates :phone, length: { minimum: 10}

  def name
    name =  "#{self.first_name} #{self.last_name}"
    name
  end
  def age
    age = Date.today.year - self.birthday.year
    age
  end

  def not_a_kid?
    #error base: hace que el erro haga referencia NO a un atributo en particular sino al objeto en su conjunto
    #dado que la edad no es un atributo, sino un metodo que surge del atributo birtday
    errors[:base] << 'To young to live' if self.age <18
  end

end
