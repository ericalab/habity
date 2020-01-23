class CreateWeeklyHabits < ActiveRecord::Migration[5.0]
  def change
    create_table :weekly_habits do |t|
      t.integer :user_id
      t.string :weekly_habit
      t.integer :weekly_total, default: 0
      t.timestamps
    end
  end
end
