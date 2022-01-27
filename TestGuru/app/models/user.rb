class User < ApplicationRecord
   has_many :created_tests, class_name: 'Test', foreign_key: 'author_id', dependent: :destroy
  
  def tests_completed_by_level(level)
    Test.joins('JOIN test_completions ON test_completions.tests_id = tests.id')
        .where(tests: { level: level }, test_completions: { users_id: id })
  end
end
