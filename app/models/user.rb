class User < ApplicationRecord
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :trackable,
         :rememberable,
         :validatable,
         :confirmable

  has_many :test_completions, dependent: :destroy
  has_many :tests, through: :test_completions
  has_many :badge_receiptions, dependent: :destroy
  has_many :badges, through: :badge_receiptions
  has_many :created_tests, class_name: "Test", foreign_key: "author_id", dependent: :destroy

  validates :email, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }

  def tests_completed_by_level(level)
    tests.by_level(level)
  end

  def test_completion(test)
    test_completions.order(id: :desc).find_by(test_id: test.id)
  end

  def admin?
    is_a?(Admin)
  end
end
