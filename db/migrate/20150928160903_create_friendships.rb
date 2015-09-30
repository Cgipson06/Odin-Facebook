class CreateFriendships < ActiveRecord::Migration
  def change
    create_table :friendships do |t|
      t.integer :invitor
      t.integer :invitee

      t.timestamps null: false
    end
  end
end
