class AddDiscriptionToParkingSpot < ActiveRecord::Migration[5.1]
  def change
  	add_column :parking_spots, :description, :string
  end
end
