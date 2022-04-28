module TestCompletionsHelper
  def current_progress(test_completion)
    ((test_completion.current_question_number.to_f - 1) / test_completion.current_test_questions_count * 100).floor
  end
end
