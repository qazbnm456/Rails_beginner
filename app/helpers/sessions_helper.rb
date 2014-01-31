module SessionsHelper

  def signed_in?
    !current_user.nil?
  end

  def require_user
    if !signed_in?
      flash[:error] = "You must log in to do that."
      redirect_to root_path
    end
  end

  def current_user=(user)
    @current_user = user
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_user?(user)
    user == current_user
  end

  def access_denied
    flash[:error] = "You can't do that."
    redirect_to root_path
  end

  def redirect_back_or(default)
    redirect_to(session[:return_to] || default)
    session.delete(:return_to)
  end

  def store_location
    session[:return_to] = request.fullpath if request.get?
  end
end