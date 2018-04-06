class Parkingspot < ApplicationRecord
	 include ImageUploader[:image]
#Relations
	belongs_to :user
	has_many :reservations, :dependent => :delete_all
	# has_many :photos

#Geocoder
	geocoded_by :address
	after_validation :geocode, if: :address_changed?

#Parkingspot validations
 	validates :listing_name, length: {maximum: 50}, presence: true
 	validates :description, length: {maximum: 500}, presence: true
 	validates :address, presence: true
  validates :user_id, presence: true
  validates :price, presence: true
  validates :image, presence: true


end
