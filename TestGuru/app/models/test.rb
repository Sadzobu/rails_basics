class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User'

  has_many :questions
  has_many :test_completions
  has_many :users, through: :test_completions

  def self.tests_by_category_title_desc(title)
    joins('JOIN categories ON tests.categories_id = categories.id')
      .where(categories: { title: title })
      .order(title: :desc)
      .pluck(:title)
  end
end
