module UsersHelper
    def has_projects?
        if User.projects.empty? then
            return false
        else
            return true
        end
    end
end
