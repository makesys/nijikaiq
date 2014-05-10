class CreateQuizzes < ActiveRecord::Migration
    def change
        create_table :quizzes do |t|
            t.references :quiztype, index:true
            t.string :owner_user_id
            t.string :quiz_title
            t.text   :quiz_text
            t.string :quiz_parts1 
            t.string :quiz_parts2 
            t.string :quiz_parts3 
            t.string :quiz_parts4 
            t.string :quiz_parts5 
            t.string :quiz_parts6 
            t.string :quiz_parts7 
            t.string :quiz_parts8
            t.string :quiz_parts9 
            t.string :quiz_parts10 
            t.timestamps
        end
    end
end
