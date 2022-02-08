class CreateTests < ActiveRecord::Migration[6.1]
  def change
    create_table :tests do |t|
      t.string :title, null: false
      t.integer :level, null: false, default: 0
      t.belongs_to :categories, null: false, foreign_key: true
      t.belongs_to :users, null: false, foreign_key: true

      t.timestamps
    end
  end
end