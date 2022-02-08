class AddUserToTestCompletions < ActiveRecord::Migration[6.1]
  def change
    remove_reference :test_completions, :users, index: true, foreign_key: true
    remove_reference :test_completions, :tests, index: true, foreign_key: true
    add_reference :test_completions, :user, null: false, foreign_key: true
    add_reference :test_completions, :test, null: false, foreign_key: true
  end
end
