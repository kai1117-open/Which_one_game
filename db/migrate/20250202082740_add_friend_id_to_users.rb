class AddFriendIdToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :friend_id, :integer, unique: true
    add_index :users, :friend_id, unique: true
  end
end
