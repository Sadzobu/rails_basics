class AddQuestionToAnswers < ActiveRecord::Migration[6.1]
  def change
    remove_reference :answers, :questions, index: true, foreign_key: true
    add_reference :answers, :question, null: false, foreign_key: true
  end
end
