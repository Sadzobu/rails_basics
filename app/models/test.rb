class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: "User"

  has_many :questions, dependent: :destroy
  has_many :test_completions, dependent: :destroy
  has_many :users, through: :test_completions

  validates :title, presence: true, uniqueness: { scope: :level }
  validates :level, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  scope :by_level, ->(level) { where(level: level) }
  scope :by_category, ->(title) { joins(:category).where(categories: { title: title }) }
  scope :easy, -> { by_level(0..1) }
  scope :medium, -> { by_level(2..4) }
  scope :hard, -> { by_level(5..Float::INFINITY) }
  scope :ready, -> { where(ready: true) }

  def self.tests_by_category_title_desc(title)
    by_category(title).order(title: :desc).pluck(:title)
  end
end
