class AddTimeLimitToTests < ActiveRecord::Migration[6.1]
  def change
    add_column :tests, :time_limit, :datetime
    add_column :test_completions, :deadline, :datetime
  end
end
