class AddReadyToTests < ActiveRecord::Migration[6.1]
  def change
    add_column :tests, :ready, :boolean, default: false, null: false
  end
end
