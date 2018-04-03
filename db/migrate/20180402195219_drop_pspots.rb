class DropPspots < ActiveRecord::Migration[5.1]
  def change
  	drop_table :parking_spots
  	
  end
end
