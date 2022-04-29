class TestCompletion < ApplicationRecord
  SUCCESS_THRESHOLD = 85

  belongs_to :test
  belongs_to :user
  belongs_to :current_question, class_name: "Question", optional: true

  before_validation :before_validation_set_current_question

  def completed?
    current_question.nil?
  end

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)
    save
  end

  def current_question_number
    self.test.questions.index(current_question) + 1
  end

  def current_test_questions_count
    test.questions.count
  end

  def current_progress
    ((current_question_number.to_f - 1) / current_test_questions_count * 100).floor
  end

  def result
    (correct_questions.to_f / current_test_questions_count * 100).round(2)
  end

  def success?
    result >= SUCCESS_THRESHOLD
  end

  private

  def before_validation_set_current_question
    self.current_question = next_question
  end

  def correct_answer?(answer_ids)
    correct_answers.ids.sort == answer_ids.map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.correct
  end

  def next_question
    if current_question.nil?
      test.questions.order(:id).first
    else
      test.questions.order(:id).where("id > ?", current_question.id).first
    end
  end
end
