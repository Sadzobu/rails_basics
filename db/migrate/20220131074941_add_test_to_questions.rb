class AddTestToQuestions < ActiveRecord::Migration[6.1]
  def change
    remove_reference :questions, :tests, index: true, foreign_key: true
    add_reference :questions, :test, null: false, foreign_key: true
  end
end
