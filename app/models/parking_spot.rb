class ParkingSpot < ApplicationRecord
	belongs_to :user
	has_many :rents
end
