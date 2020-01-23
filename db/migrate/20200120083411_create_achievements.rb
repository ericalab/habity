class CreateAchievements < ActiveRecord::Migration[5.0]
  def change
    create_table :achievements do |t|
      t.integer :user_id
      t.integer :habit_id
      t.timestamps
    end
  end
end
