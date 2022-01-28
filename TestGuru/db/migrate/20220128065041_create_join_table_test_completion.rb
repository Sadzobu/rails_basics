class CreateJoinTableTestCompletion < ActiveRecord::Migration[6.1]
  def change
    create_join_table :users, :tests, table_name: :test_completions do |t|
      t.index [:user_id, :test_id], unique: true
      # t.index [:test_id, :user_id]
    end
  end
end
