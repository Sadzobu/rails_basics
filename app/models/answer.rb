class Answer < ApplicationRecord
  belongs_to :question

  validates :body, presence: true
  validate  :answer_count, on: :create

  scope :correct, -> { where(correct: true) }

  private

  def answer_count
    errors.add(:base, "Question can only have up to 4 answers!") if question.answers.count >= 4
  end
end
