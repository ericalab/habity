class CreateHabits < ActiveRecord::Migration[5.0]
  def change
    create_table :habits do |t|
      t.integer :user_id
      t.string :daily
      t.integer :daily_total
      t.string  :weekly
      t.integer :weekly_total

      t.timestamps
    end
  end
end
