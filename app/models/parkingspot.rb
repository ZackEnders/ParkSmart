class Parkingspot < ApplicationRecord
	belongs_to :user
	has_many :reservations
	# has_many :photos
	# geocoded_by :address
	# after_validation :geocode, if: :address_changed?
 	validates :listing_name, length: {maximum: 50}
 	validates :description, length: {maximum: 500}
end
