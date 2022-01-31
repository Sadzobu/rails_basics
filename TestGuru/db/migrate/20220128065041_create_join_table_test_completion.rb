class CreateJoinTableTestCompletion < ActiveRecord::Migration[6.1]
  def change
    create_join_table :users, :tests, table_name: :test_completions do |t|
      t.index [:user_id, :test_id], unique: true
      # t.index [:test_id, :user_id]
    end
    change_column_null :test_completions, :user_id, false
    change_column_null :test_completions, :test_id, false
    add_foreign_key :test_completions, :users
    add_foreign_key :test_completions, :tests
  end
end
