class Parkingspot < ApplicationRecord
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

#Paperclip validations 
	has_attached_file :image, styles: { small: "300x300>", med: "500x500>", large: "800x800>" }
  validates_attachment :image, presence: true,
  content_type: { content_type: ["image/jpeg","image/jpg","image.png"], :message => "Upload must be an image" },
  size: { in: 0..3.megabytes, :message => "Image must be less than 3 megabytes in size" }
  validates_attachment_content_type :image, content_type: /\Aimage/
end
