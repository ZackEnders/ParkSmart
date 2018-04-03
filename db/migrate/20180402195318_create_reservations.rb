class CreateReservations < ActiveRecord::Migration[5.1]
  def change
    create_table :reservations do |t|
    	t.references :user, index: true, foreign_key: true
      t.references :parkingspot, index: true, foreign_key: true
      t.float :price
      t.float :total
      t.datetime :start_date
      t.datetime :end_date
      
      t.timestamps
    end
  end
end
