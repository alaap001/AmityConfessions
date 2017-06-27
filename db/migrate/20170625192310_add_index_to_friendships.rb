class AddIndexToFriendships < ActiveRecord::Migration[5.0]
  def change
  	add_index :friendships, [:amitian_id,:friend_id], unique: true
  end
end
