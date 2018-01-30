class Room < ApplicationRecord
	belongs_to :motel
	has_many :bookings

	validates :motel, presence: true
  validates :name, presence: true
end
