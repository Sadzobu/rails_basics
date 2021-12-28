class Test < ApplicationRecord
  def self.tests_by_category_title_desc(title)
    joins('JOIN categories ON tests.categories_id = categories.id')
      .where(categories: { title: title })
      .order(title: :desc)
      .pluck(:title)
  end
end
