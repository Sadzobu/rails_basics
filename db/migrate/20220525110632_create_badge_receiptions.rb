class CreateBadgeReceiptions < ActiveRecord::Migration[6.1]
  def change
    create_table :badge_receiptions do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :badge, null: false, foreign_key: true

      t.timestamps
    end
  end
end
