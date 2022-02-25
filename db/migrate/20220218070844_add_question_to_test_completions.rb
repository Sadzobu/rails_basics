class AddQuestionToTestCompletions < ActiveRecord::Migration[6.1]
  def change
    add_reference :test_completions, :current_question, foreign_key: { to_table: :questions }
    add_column :test_completions, :correct_questions, :integer, default: 0
  end
end
