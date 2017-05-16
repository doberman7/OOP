
#    DATE, TIME OR DATETIME?
  #http://stackoverflow.com/questions/3928275/in-ruby-on-rails-whats-the-difference-between-datetime-timestamp-time-and-da
  #https://dev.mysql.com/doc/refman/5.7/en/date-and-time-types.html
# Available transformations are: http://api.rubyonrails.org/classes/ActiveRecord/ConnectionAdapters/Table.html
class CreateFlights < ActiveRecord::Migration
  def change
    create_table :flights do |t|
      # Completa con las columnas que necesites
      #dataType   column
      t.integer :num_flight
      t.date :date
      #orignaly used '.time' but deliver's a 'depart: "2000-01-01 08:15:15",' format
      t.string :depart
      t.string :from
      t.string :to
      t.string :duration
      t.float :cost
      t.integer :passengers
      t.timestamps
    end

    create_table :users do |t|
    	# Completa con las columnas que necesites
      t.string :name
      t.string :email
      t.boolean :admin, default: false
      t.timestamps
    end

    #crea las tablas restantes
    create_table :bookings do |t|
      t.integer :flight_id
      t.integer :num_booking
      t.float :total
      t.timestamps
    end
    #JOIN TABLES------------------------
    create_table :user_bookings do |t|
      t.integer :user_id
      t.integer :booking_id
      t.timestamps
    end

    create_table :user_flights do |t|
      t.integer :flight_id
      t.integer :user_id
      t.timestamps
    end
  end
end
