class Reservation < ApplicationRecord
#Relations
	belongs_to :user
  belongs_to :parkingspot
  
 #Reservation validations
  validates :parkingspot_id, presence: true
  validates :user_id, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
end
