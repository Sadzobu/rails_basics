class AddPassedToTestCompletions < ActiveRecord::Migration[6.1]
  def change
    add_column :test_completions, :passed, :boolean, default: false, null: false
  end
end
