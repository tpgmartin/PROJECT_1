class ApplicationController < ActionController::Base
  protect_from_forgery
  
  helper_method :current_user
  before_filter :can_access_route

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url , alert: "You can't access this page"
  end

  def index
    render text: "Hello!"
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user    
  end

  private
  def can_access_route
    raise 'Permission rejected' unless authorized?(current_user, params[:controller], params[:action])
  end

  private
  def authorized?(user, controller, action)
    case user.try(:role)
    when "admin" then true
    when "user"
      case controller
        when "secret" then false
        when "gossip" then true
      else
        true
      end
    else
      true
    end
  end

  private
  def authenticate
    unless logged_in?
      flash[:error] = "You must be logged in to access this section of the site"
      redirect_to login_path
    end
  end
end
