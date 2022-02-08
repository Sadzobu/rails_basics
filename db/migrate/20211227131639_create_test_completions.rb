class CreateTestCompletions < ActiveRecord::Migration[6.1]
  def change
    create_table :test_completions do |t|
      t.belongs_to :users, null: false, foreign_key: true
      t.belongs_to :tests, null: false, foreign_key: true

      t.timestamps
    end
  end
end
