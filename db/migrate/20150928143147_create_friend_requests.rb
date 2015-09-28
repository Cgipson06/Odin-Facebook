class CreateFriendRequests < ActiveRecord::Migration
  def change
    create_table :friend_requests do |t|
      t.integer :user_id
      t.integer :recipient_id
      t.text :message

      t.timestamps null: false
    end
  end
end
