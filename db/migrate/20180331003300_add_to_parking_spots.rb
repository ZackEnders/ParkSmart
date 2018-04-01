class AddToParkingSpots < ActiveRecord::Migration[5.1]
  def change
  	remove_column :parking_spots, :availability, :datetime
  	add_column :parking_spots, :start_time, :datetime
  	add_column :parking_spots, :end_time, :datetime
  end
end
