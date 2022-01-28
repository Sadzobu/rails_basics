class User < ApplicationRecord
  has_many :test_completions
  has_many :tests, through: :test_completions, dependent: :destroy
  has_many :created_tests, class_name: 'Test', foreign_key: 'author_id', dependent: :destroy

  def tests_completed_by_level(level)
    tests.where(level: level)
  end
end
