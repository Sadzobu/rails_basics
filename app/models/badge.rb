class Badge < ApplicationRecord
  has_many :badge_receiptions, dependent: :destroy
  has_many :users, through: :badge_receiptions

  validates :name, presence: true, uniqueness: true
  validates :rule, presence: true

  enum rule: { all_in_level: 0, all_in_category: 1, first_time: 2 }
end
