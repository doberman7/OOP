#http://guides.rubyonrails.org/active_record_querying.html
#https://medium.com/@jbmilgrom/active-record-many-to-many-self-join-table-e0992c27c1e
class Flight < ActiveRecord::Base
	has_many :users
	has_many :bookings
end

class User < ActiveRecord::Base
	has_many :flights
	has_many :bookings
end

class Booking < ActiveRecord::Base
	has_many :users
	belongs_to :flight
end

class UserBooking < ActiveRecord::Base
	belongs_to :user
	belongs_to :booking
end

class UserFlight < ActiveRecord::Base
	belongs_to :user
	belongs_to :flight
end
