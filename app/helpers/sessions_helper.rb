module SessionsHelper

  # Logs in the given user.
  def log_in(user)
    session[:user_id] = user.id
    session[:user_email] = user.email
  end

  def current_user
    @current_user ||= User.find_by(email: session[:user_email])
  end

end