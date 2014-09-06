class AddAnswerToQuiz < ActiveRecord::Migration
  def change
    add_column :quizzes, :answer, :string
  end
end
