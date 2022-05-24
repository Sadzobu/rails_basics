class Badge < ApplicationRecord
  belongs_to :author, class_name: "User"

  validates :name, presence: true, uniqueness: true
  validates :rule, presence: true

  enum rule: [:AllTestsInCategory, :AllTestsOfLevel, :FirstTime]
end
