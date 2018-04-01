class CreateRents < ActiveRecord::Migration[5.1]
  def change
    create_table :rents do |t|
    	t.integer :parking_spot_id
    	t.integer :buyer_id
    	t.integer :seller_id
    	t.float :rate
    	t.datetime :rentalTime

      t.timestamps
    end
  end
end
