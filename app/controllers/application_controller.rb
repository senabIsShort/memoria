class ApplicationController < ActionController::Base
    before_action :authorize

    delegate :allow?, to: :current_permission
    helper_method :allow?

    private

    def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    helper_method :current_user

    def current_permission
        @current_permission ||= Permission.new(current_user)
    end

    def authorize
        if !current_permission.allow?(params[:controller], params[:action])
            flash[:danger] = "Action is not authorized."
            redirect_to root_url
        end
    end
end
