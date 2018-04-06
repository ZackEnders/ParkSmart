class AddPhotoParkingspots < ActiveRecord::Migration[5.1]
  def change
  	add_column :parkingspots, :image_data, :text
  end
end
