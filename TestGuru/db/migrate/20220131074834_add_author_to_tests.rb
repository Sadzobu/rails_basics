class AddAuthorToTests < ActiveRecord::Migration[6.1]
  def change
    remove_reference :tests, :categories, index: true, foreign_key: true
    remove_reference :tests, :users, index: true, foreign_key: true
    add_reference :tests, :author, null: false, foreign_key: { to_table: :users }
    add_reference :tests, :category, null: false, foreign_key: true
  end
end
