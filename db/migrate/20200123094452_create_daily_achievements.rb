class CreateDailyAchievements < ActiveRecord::Migration[5.2]
  def change
    create_table :daily_achievements do |t|
      t.references :user, foreign_key: true
      t.references :daily_habit, foreign_key: true
      t.timestamps
    end
  end
end
