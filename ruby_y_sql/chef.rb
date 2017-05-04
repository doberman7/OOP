require 'sqlite3'
require 'faker'

class Chef
  #Se inisializa el obj Chef,
  def initialize(id,first_name,last_name,birthday,email,phone,created_at=Time.now,updated_at=Time.now)
    @id = id
    @first_name = first_name
    @last_name = last_name
    @email = email
    @phone = phone
    @created_at = created_at
    @updated_at = updated_at
  end
  #Con self el metodo fubciona desde la definicion del objeto, sin necesidad de instanciarlo
  def self.create_table
    # .db es la vasriable de clase "@@db"
    Chef.db.execute(
      <<-SQL
        CREATE TABLE chefs (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          first_name VARCHAR(64) NOT NULL,
          last_name VARCHAR(64) NOT NULL,
          birthday DATE NOT NULL,
          email VARCHAR(64) NOT NULL,
          phone VARCHAR(64) NOT NULL,
          created_at DATETIME NOT NULL,
          updated_at DATETIME NOT NULL
        );
      SQL
    )
  end

  def self.seed
    Chef.db.execute(
      <<-SQL
      --se insertan las columnas
        INSERT INTO chefs
          (first_name, last_name, birthday, email, phone, created_at, updated_at)
        VALUES
        --se ingresan los valores de vada fila de la tabla, como dio hueva inventar valor, usamos fakers
          ('Ferran', 'Adriá', '1985-02-09', 'ferran.adria@elbulli.com', '42381093238', DATETIME('now'), DATETIME('now')),
          ('#{Faker::Name.first_name}', '#{Faker::Name.last_name }', '1985-02-09', '#{Faker::Internet.email}', "#{Faker::PhoneNumber.phone_number}", DATETIME('now'), DATETIME('now')),
          ('#{Faker::Name.first_name}', '#{Faker::Name.last_name }', '1985-02-09', '#{Faker::Internet.email}', "#{Faker::PhoneNumber.phone_number}", DATETIME('now'), DATETIME('now')),
          ('#{Faker::Name.first_name}', '#{Faker::Name.last_name }', '1985-02-09', '#{Faker::Internet.email}', "#{Faker::PhoneNumber.phone_number}", DATETIME('now'), DATETIME('now')),
          ('#{Faker::Name.first_name}', '#{Faker::Name.last_name }', '1985-02-09', '#{Faker::Internet.email}', "#{Faker::PhoneNumber.phone_number}", DATETIME('now'), DATETIME('now')),
          ('#{Faker::Name.first_name}', '#{Faker::Name.last_name }', '1985-02-09', '#{Faker::Internet.email}', "#{Faker::PhoneNumber.phone_number}", DATETIME('now'), DATETIME('now')),
          ('#{Faker::Name.first_name}', '#{Faker::Name.last_name }', '1985-02-09', '#{Faker::Internet.email}', "#{Faker::PhoneNumber.phone_number}", DATETIME('now'), DATETIME('now')),
          ('#{Faker::Name.first_name}', '#{Faker::Name.last_name }', '1985-02-09', '#{Faker::Internet.email}', "#{Faker::PhoneNumber.phone_number}", DATETIME('now'), DATETIME('now')),
          ('#{Faker::Name.first_name}', '#{Faker::Name.last_name }', '1985-02-09', '#{Faker::Internet.email}', "#{Faker::PhoneNumber.phone_number}", DATETIME('now'), DATETIME('now')),
          ('#{Faker::Name.first_name}', '#{Faker::Name.last_name }', '1985-02-09', '#{Faker::Internet.email}', "#{Faker::PhoneNumber.phone_number}", DATETIME('now'), DATETIME('now')),
          ('#{Faker::Name.first_name}', '#{Faker::Name.last_name }', '1985-02-09', '#{Faker::Internet.email}', "#{Faker::PhoneNumber.phone_number}", DATETIME('now'), DATETIME('now')),
          ('#{Faker::Name.first_name}', '#{Faker::Name.last_name }', '1985-02-09', '#{Faker::Internet.email}', "#{Faker::PhoneNumber.phone_number}", DATETIME('now'), DATETIME('now')),
          ('#{Faker::Name.first_name}', '#{Faker::Name.last_name }', '1985-02-09', '#{Faker::Internet.email}', "#{Faker::PhoneNumber.phone_number}", DATETIME('now'), DATETIME('now'))
          ;
      SQL
    )
  end
  #self permite activar el metodo directamente desde el objeto (i.e. Chef.all)
  def self.all
    Chef.db.execute(
    <<-SQL
      SELECT * FROM chefs;
    SQL
    )
  end
  #--------------------------------------------------------
  def self.where(column, value)
    Chef.db.execute(
    <<-SQL
    --seleccionar todos los datos en "chefs" donde se cumplen la igualdad de los argumentos, necesario es usar interpolacion
      SELECT * FROM chefs WHERE "#{column}" = "#{value}";
      OR
      SELECT * FROM chefs WHERE "#{column}" = ?, "#{value}";
    SQL
    #iterar en cada fila, cada fila son los datos de cada chef
    ).each do |chef|
      puts "ID     NAME   LAST NAME  BIRTHDAY       EMAIL                         PHONE                CREATED_AT             UPDATE_AT     "
      puts "#{chef[0]}     #{chef[1]}   #{chef[2]}    #{chef[3]}     #{chef[4]}    #{chef[5]}    #{chef[6]}    #{chef[7]}"
    end
  end


  private

  def self.db
    @@db ||= SQLite3::Database.new("chefs.db")
  end

end
p Chef.all
Chef.where('first_name', 'Ferran')
Chef.where('id', 10)
