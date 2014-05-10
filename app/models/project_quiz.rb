class ProjectQuiz < ActiveRecord::Base
    belongs_to :project
    belongs_to :quiz
end
