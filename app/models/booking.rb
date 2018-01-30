class Booking < ApplicationRecord
	 belongs_to :room
	 belongs_to :motel

	 validates :booking_code, uniqueness: true

end
