class Test < ApplicationRecord
  has_many :questions 
  belongs_to :category
  belongs_to :author, class_name: 'User'

  def self.tests_by_category_title_desc(title)
    joins('JOIN categories ON tests.categories_id = categories.id')
      .where(categories: { title: title })
      .order(title: :desc)
      .pluck(:title)
  end
end
