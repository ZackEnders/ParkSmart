class CreateReservations < ActiveRecord::Migration[5.1]
  def change
    create_table :reservations do |t|
    	t.integer :user_id
      t.integer :parkingspot_id
      t.float :price
      t.float :total
      t.datetime :start_date
      t.datetime :end_date
      
      t.timestamps
    end
  end
end
