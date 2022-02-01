class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User'

  has_many :questions, dependent: :destroy
  has_many :test_completions, dependent: :destroy
  has_many :users, through: :test_completions

  scope :easy, -> { where(level: 0..1) }
  scope :medium, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..Float::INFINITY) }
  scope :level, ->(level) { where(level: level) }

  scope :by_category, ->(title) { joins(:category).where(categories: { title: title }).order(title: :desc) }

  def self.tests_by_category_title_desc(title)
    by_category(title).pluck(:title)
  end
end
