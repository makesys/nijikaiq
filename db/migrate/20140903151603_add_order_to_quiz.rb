class AddOrderToQuiz < ActiveRecord::Migration
  def change
    add_column :quizzes, :order, :integer
  end
end
