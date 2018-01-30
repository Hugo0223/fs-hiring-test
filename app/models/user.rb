class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :motels
  has_many :rooms, through: :motels
  has_many :bookings, through: :motels

  validates :email, uniqueness: true, case_sensitive: false

end
