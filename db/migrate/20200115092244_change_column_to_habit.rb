class ChangeColumnToHabit < ActiveRecord::Migration[5.0]
  def change
    change_column :habits, :daily_total, :integer, default: 0
    change_column :habits, :weekly_total, :integer, default: 0
  end
end
