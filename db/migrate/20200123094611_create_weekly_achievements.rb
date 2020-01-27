class CreateWeeklyAchievements < ActiveRecord::Migration[5.2]
  def change
    create_table :weekly_achievements do |t|
      t.references :user, foreign_key: true
      t.references :weekly_habit, foreign_key: true
      t.timestamps
    end
  end
end
