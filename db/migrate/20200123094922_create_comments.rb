class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.references :user, foreign_key: true
      t.references :hobby, foreign_key: true
      t.string :content

      t.timestamps
    end
  end
end
