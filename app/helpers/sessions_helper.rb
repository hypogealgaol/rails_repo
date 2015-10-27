module SessionsHelper

  # Logs in the given user.

  def current_user
    #if @current_user.nil?
    #  @current_user = User.find(session[:user_id]) if session[:user_id]
    if @current_user.nil?
   	 @current_user = User.find_by(id: session[:user_id]) # i could also do find if session[:user_d] becase of exception
   	else
   		@current_user #ruby convention
    end
  end

  def log_in(user)
    session[:user_id] = user.id
    session[:user_email] = user.email
  end

  def log_out
  	session.delete(:user_id)
  	session.delete(:user_email)
  	@current_user = nil
  end
  
  def logged_in?
    !current_user.nil?
  end




end