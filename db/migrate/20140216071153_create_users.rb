class CreateUsers < ActiveRecord::Migration
    def change
        create_table :users do |t|
            t.string :name
            t.string :email
            t.string :fname
            t.string :lname
            t.string :password_digest
            t.string :birth
            t.string :gender
            t.string :nickname
            t.string :qpoint
            t.string :dmagree
            t.string :del_flag
            t.timestamps
        end
    end
end
