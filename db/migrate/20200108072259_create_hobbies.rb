class CreateHobbies < ActiveRecord::Migration[5.0]
  def change
    create_table :hobbies do |t|
      t.integer :user_id
      t.integer :category_id
      t.string :title
      t.string :impression

      t.timestamps
    end
  end
end
