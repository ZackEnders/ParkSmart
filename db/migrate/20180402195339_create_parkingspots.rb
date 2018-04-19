class CreateParkingspots < ActiveRecord::Migration[5.1]
  def change
    create_table :parkingspots do |t|
    	t.integer :user_id
      t.attachment :image
    	t.string :address
    	t.integer :price
      t.boolean :rented
      t.string :description
      t.float  :latitude
    	t.float  :longitude
    	t.string :listing_name
      t.timestamps
    end
  end
end
