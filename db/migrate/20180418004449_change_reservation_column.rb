class ChangeReservationColumn < ActiveRecord::Migration[5.1]
  def change

  end

  def up
    remove_column :reservations, :parkingspot
  	remove_column :reservations, :user
  end

  def down
    add_column :reservations, :parkingspot_id, :integer
    add_column :reservations, :user_id, :integer
  end
end
