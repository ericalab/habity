class RemoveColumnToDailyHabit < ActiveRecord::Migration[5.0]
  def change
    remove_column :daily_habits, :weekly, :string
    remove_column :daily_habits, :weekly_total, :integer
  end
end
