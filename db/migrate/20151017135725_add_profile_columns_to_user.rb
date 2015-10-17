class AddProfileColumnsToUser < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.string :job_title
      t.string :job_location
      t.string :college
      t.string :current_city
      t.string :hometown
    end
  end
end
