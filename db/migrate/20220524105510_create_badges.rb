class CreateBadges < ActiveRecord::Migration[6.1]
  def change
    create_table :badges do |t|
      t.string :name, null: false
      t.string :filename
      t.integer :rule, null: false

      t.timestamps
    end
  add_index :badges, :name, unique: true
  add_reference :badges, :author, null: false, foreign_key: { to_table: :users }
  end
end
