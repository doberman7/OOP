class CreateFlights < ActiveRecord::Migration
  def change
    create_table :flights do |t|
      # Completa con las columnas que necesites
      t.num_flight
      t.date
      t.depart
      t.form
      t.to
      t.duration
      t.cost
      t.passengers
    end

    create_table :users do |t|
    	# Completa con las columnas que necesites
      t.name
      t.email
      t.admin
    end

    #crea las tablas restantes
    create_table :bookings do |t|
      t.id_users
      t.id_fligts
      t.num_booking
    end
  end
end
