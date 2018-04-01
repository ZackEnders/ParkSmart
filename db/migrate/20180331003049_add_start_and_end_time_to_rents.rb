class AddStartAndEndTimeToRents < ActiveRecord::Migration[5.1]
  def change
  	add_column :rents, :start_time, :datetime
  	add_column :rents, :end_time, :datetime
  	remove_column :rents, :rentalTime, :datetime
  end
end
