class Droprents < ActiveRecord::Migration[5.1]
  def change
  	drop_table :rents
  end
end
