class AddIndexToFriendRequests < ActiveRecord::Migration
  def change
    add_index :friend_requests, [:user_id, :recipient_id], :unique => true
  end
end
