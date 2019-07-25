class ApplicationController < ActionController::Base

    helper_method :current_user, :logged_in?

    def current_user
        #Checks first if is there already an current user, to not being hiting the db so many times
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    def logged_in?
        #converts the obj in true/false, to check if the ir an user or not
        !!current_user 
    end

    def requeire_user
        if !logged_in?
            flash[:danger] = "You must be logged in to do this action"
            redirect_to root_path
        end
    end
end
