class RenameHabittoDailyhabit < ActiveRecord::Migration[5.0]
  def change
    rename_table :habits, :daily_habits
  end
end
