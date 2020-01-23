class RenameAchievementtoDailyAchievement < ActiveRecord::Migration[5.0]
  def change
    rename_table :achievements, :daily_achievements
  end
end
