class ApplicationController < ActionController::Base
  include InheritedResources::DSL
  helper :all # include all helpers, all the time
  protect_from_forgery
  filter_parameter_logging :password, :password_confirmation
  before_filter :require_user
  helper_method :current_user_session, :current_user, :logged_in?

  def set_current_user
    Authorization.current_user = current_user
  end

  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.record
  end

  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end

  def logged_in?
    !current_user.nil?
  end

  def require_user
    unless current_user
      respond_to do |f|
        f.html {
          store_location
          flash[:notice] = "You must be logged in to access this page"
          redirect_to login_url
        }

        f.json {
          render :status => :forbidden, :json => {:response_code => "Error", :message => "You must be logged in to access this page"}.to_json
        }
      end
      return false
    end
  end

  def require_no_user
    if current_user
      store_location
      flash[:notice] = "You must be logged out to access this page"
      redirect_to account_url
      return false
    end
  end

  def store_location
    session[:return_to] = request.request_uri
  end

  def redirect_back_or_default(default)
    redirect_to(session[:return_to] || default)
    session[:return_to] = nil
  end

  def redirect_by_user_role
      if @user_session.user.admin?
        redirect_to(admin_root_path)
      else
        redirect_to root_path
      end
  end
end
