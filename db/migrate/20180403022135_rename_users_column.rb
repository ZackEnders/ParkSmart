class RenameUsersColumn < ActiveRecord::Migration[5.1]
  def change
  	rename_column :users, :discription, :description
  end
end
