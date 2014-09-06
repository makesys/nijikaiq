class Quiz < ActiveRecord::Base
    validates_presence_of :quiz_text,:quiz_title,:quiz_parts1,:quiz_parts2,:quiz_parts3,:quiz_parts4,:order, :answer
    has_many    :project_quizzes
    has_many    :projects, :through => :project_quizzes, :order => 'order'
end
