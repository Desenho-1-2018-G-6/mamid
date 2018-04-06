module SessionsHelper

  def log_in(user)
    session[:user_id] = user.id
    cookies[:user_id] = user.id
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
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
      redirect_to home_path(current_user)
    end
  end
end