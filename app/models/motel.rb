class Motel < ApplicationRecord
	belongs_to :user

	has_many :rooms
	has_many :bookings

	validates :name, presence: true
	validates :user, presence: true
end
