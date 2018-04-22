module SessionsHelper

  def log_in(user)
    session[:user_id] = user.id
    cookies[:user_id] = user.id
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]).decorate if session[:user_id]
  end

  def logged_in?
    !current_user.nil?
  end

  def log_out
    session.delete(:user_id)
	  @current_user = nil
  end

  def authenticate_user
    if !logged_in?
      redirect_to root_path
    else
      cookies[:user_id] = current_user.id
    end
  end

  def not_allow_to_enter_login
    if logged_in?
      redirect_to root_path
    end
  end

  def check_current_user
    if logged_in?
        if !@current_user.user_type == "admin"
          # redirect_to users_path + user.id
        end
    else
        redirect_to root_path
    end
  end

  def require_login
    unless logged_in?
      flash[:error] = "You must be logged in to access this section"
      redirect_to login_url # halts request cycle
    end
  end
end
