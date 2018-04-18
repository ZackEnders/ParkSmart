class RemoveKeyFromPs < ActiveRecord::Migration[5.1]
  def up
    remove_column :parkingspots, :user
  end

  def down
    add_column :parkingspots, :user_id, :integer
  end
end
