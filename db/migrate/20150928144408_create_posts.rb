class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :author
      t.text :title
      t.text :content
      t.boolean :public
      t.datetime :created
      

      t.timestamps null: false
    end
  end
end
