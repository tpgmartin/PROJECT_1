class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user

  rescue_from CanCan::AccessDenied do |exception|
    alert_message = case 
                    when current_user
                      "You don't have access to this page."
                    else
                      "You need to login to access this page."
                    end
    redirect_to root_path, alert: alert_message
  end

  private
  def current_user
    begin
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    rescue ActiveRecord::RecordNotFound
      session.delete(:user_id)
      return nil      
    end
  end
end
