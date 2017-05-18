# Este archivo sirve para crear registros de prueba
require 'faker'
Flight.create(num_flight: rand(47615), date: Faker::Date.forward(23), depart: "08:15:15", from: "Cancun", to: "CDMX", duration: "2:00:00", cost: 2100.00, passengers: 100)
Flight.create(num_flight: rand(47615), date: Faker::Date.forward(23), depart: "11:33:25", from: "CDMX", to: "Durango", duration: "2:00:00", cost: 3200.00, passengers: 90)
Flight.create(num_flight: rand(47615), date: Faker::Date.forward(23), depart: "09:45:00", from: "Monterrey", to: "CDMX", duration: "3:00:00", cost: 3000.00, passengers: 150)
Flight.create(num_flight: rand(47615), date: Faker::Date.forward(23), depart: "10:05:00", from: "Guadalajara", to: "CDMX", duration: "2:00:00", cost: 1500.00, passengers: 80)
Flight.create(num_flight: rand(47615), date: Faker::Date.forward(23), depart: "06:30:00", from: "CDMX", to: "Toluca", duration: "3:00:00", cost: 1900.00, passengers: 110)
Flight.create(num_flight: rand(47615), date: Faker::Date.forward(23), depart: "11:00:00", from: "Monterrey", to: "CDMX", duration: "2:00:00", cost: 2200.00, passengers: 90)
Flight.create(num_flight: rand(47615), date: Faker::Date.forward(23), depart: "12:10:00", from: "Cancun", to: "CDMX", duration: "3:00:00", cost: 3000.00, passengers: 80)
Flight.create(num_flight: rand(47615), date: Faker::Date.forward(23), depart: "11:17:17", from: "Guadalajara", to: "CDMX", duration: "2:00:00", cost: 2200.00, passengers: 90)
Flight.create(num_flight: rand(47615), date: Faker::Date.forward(23), depart: "12:50:00", from: "Cancun", to: "CDMX", duration: "3:00:00", cost: 2500.00, passengers: 80)
Flight.create(num_flight: rand(47615), date: Faker::Date.forward(23), depart: "07:25:00", from: "CDMX", to: "Durango", duration: "2:00:00", cost: 3500.00, passengers: 80)

#USER's
#only the User.name=admin is has a "admin: true"
User.create(name: 'admin', email: 'email', admin: true, password:"pass")
User.create(name: 'admin2', email: 'email2', admin: true, password:"pass")
#for the rest of users the value is "admin, default: false"
User.create(name: Faker::Name.name, email: Faker::Internet.email, password:"123")
User.create(name: Faker::Name.name, email: Faker::Internet.email, password:"123")
#Booking
Booking.create(flight_id: 1, num_booking: 1, total: 0.0)
