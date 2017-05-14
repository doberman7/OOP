class Task < ActiveRecord::Base

# Fíjate en la línea anterior como este modelo está heredando de la clase
# ActiveRecord::Base
# Que tanto código te regala ActiveRecord

#validates the presence of the name atribute
validates :name, presence: true

end
