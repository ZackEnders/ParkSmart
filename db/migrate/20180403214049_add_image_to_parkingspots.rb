class AddImageToParkingspots < ActiveRecord::Migration[5.1]
  def change
  	add_column :parkingspots, :image, :string
  end
end
