class CreateProjectQuizzes < ActiveRecord::Migration
  def change
    create_table :project_quizzes do |t|
        t.references :project
        t.references :quiz
    end
  end
end
