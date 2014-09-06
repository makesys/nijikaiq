class Project < ActiveRecord::Base
    belongs_to  :user
    has_many    :project_quizzes
    has_many    :quizzes,
                :through => :project_quizzes,
                :order => 'quizzes.order asc'
end
