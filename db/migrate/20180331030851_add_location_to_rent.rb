class AddLocationToRent < ActiveRecord::Migration[5.1]
  def change
  	add_column :rents, :location, :string
  end
end
