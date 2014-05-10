class Quiz < ActiveRecord::Base
    has_many    :project_quizzes
    has_many    :projects, :through => :project_quizzes
end
