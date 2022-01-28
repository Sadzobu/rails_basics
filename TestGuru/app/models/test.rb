class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User'

  has_many :questions, dependent: :destroy
  has_many :test_completions
  has_many :users, through: :test_completions, dependent: :destroy

  def self.tests_by_category_title_desc(title)
    joins(:category).where(categories: { title: title }).order(title: :desc).pluck(:title)
  end
end
