#http://guides.rubyonrails.org/active_record_querying.html
#https://medium.com/@jbmilgrom/active-record-many-to-many-self-join-table-e0992c27c1e
class Flight < ActiveRecord::Base
  validates :num_flight, presence: true
  validates :date, presence: true
  validates :num_flight, presence: true
  validates :date, presence: true
  validates :depart, presence: true
  validates :from, presence: true
  validates :to, presence: true
  validates :duration, presence:true
  validates :cost, presence: true
  validates :passengers, presence: true
  #---------------------------
	has_many :users
	has_many :bookings
end

class User < ActiveRecord::Base
  validates :name, presence: true
  validates :email, presence: true
  #--------------
	has_many :flights
	has_many :bookings
end

class Booking < ActiveRecord::Base
  validates :flight_id, presence: true
  validates :num_booking, presence: true
  validates :total, presence: true
  #------
	has_many :users
	belongs_to :flight
end
# JOIN TABLES: user_bookings and user_flights
class UserBooking < ActiveRecord::Base
  validates :user_id, presence: true
  validates :booking_id, presence: true
  #------------------------
	belongs_to :user
	belongs_to :booking
end

class UserFlight < ActiveRecord::Base
  validates :flight_id, presence: true
  validates :user_id, presence: true
  #---------------
	belongs_to :user
	belongs_to :flight
end
