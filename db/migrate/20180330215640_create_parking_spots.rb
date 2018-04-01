class CreateParkingSpots < ActiveRecord::Migration[5.1]
  def change
    create_table :parking_spots do |t|
    	t.integer :user_id
    	t.float :rate
    	t.string :location
    	t.string :image
    	t.datetime :availability
    	t.boolean :rented
    	t.integer :spotsAvail

      t.timestamps
    end
  end
end
