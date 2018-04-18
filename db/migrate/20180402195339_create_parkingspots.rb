class CreateParkingspots < ActiveRecord::Migration[5.1]
  def change
    create_table :parkingspots do |t|
    	t.references :user, index: true, foreign_key: true
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
