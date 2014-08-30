class ApplicationController < ActionController::Base
    # Prevent CSRF attacks by raising an exception.
    # For APIs, you may want to use :null_session instead.
    protect_from_forgery with: :exception
    include SessionsHelper
    include UsersHelper

    def authorize
        unless signed_in?
            session[:jumpto] = request.parameters
#            redirect_to :controller => 'sessions', :action => 'new'
            redirect_to "/signin"
        end
    end
end
