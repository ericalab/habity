class Renamedailyhabits < ActiveRecord::Migration[5.0]
  def change
    rename_column :daily_habits, :daily, :name
    rename_column :daily_habits, :daily_total, :total
    rename_column :weekly_habits, :weekly_habit, :name
    rename_column :weekly_habits, :weekly_total, :total
    
  end
end
