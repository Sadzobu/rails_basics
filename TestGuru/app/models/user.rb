class User < ApplicationRecord
  has_many :test_completions, dependent: :destroy
  has_many :tests, through: :test_completions
  has_many :created_tests, class_name: 'Test', foreign_key: 'author_id', dependent: :destroy

  def tests_completed_by_level(level)
    tests.level(level)
  end
end
