class CreateEndUsers < ActiveRecord::Migration
  def change
    create_table :end_users do |t|
      t.integer :user_id
      t.string :name
      t.string :occupation

      t.timestamps null: false
    end
  end
end
