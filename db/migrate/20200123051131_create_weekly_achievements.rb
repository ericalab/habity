class CreateWeeklyAchievements < ActiveRecord::Migration[5.0]
  def change
    create_table :weekly_achievements do |t|
      t.integer :user_id
      t.integer :habit_id
      t.timestamps
    end
  end
end
