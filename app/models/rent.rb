class Rent < ApplicationRecord
	has_many :parking_spots
	has_many :users
end
