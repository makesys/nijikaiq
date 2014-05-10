class CreateQuiztypes < ActiveRecord::Migration
  def change
    create_table :quiztypes do |t|
      t.string :quiztype_name
      t.string :quiztype_description
      t.string :quiztype_def1
      t.string :quiztype_def2
      t.string :quiztype_def3
      t.string :quiztype_def4
      t.string :quiztype_def5
      t.string :quiztype_def6
      t.string :quiztype_def7
      t.string :quiztype_def8
      t.string :quiztype_def9
      t.string :quiztype_def10
      t.timestamps
    end
  end
end
