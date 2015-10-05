class SessionsController < ApplicationController

  skip_before_filter :require_user, :only => [:new, :create, :login]

  def new
    #@user = User.new
  end

  def create
    user = User.find_by(email: params[:session][:email])
    puts "tried to find user"
    if user
      puts "userfound: successful login" #testing
      session[:user_id] = user.id
      session[:user_email] = user.email
      redirect_to users_path
    else
      flash[:notice] = "Unsuccessful login"
      puts "unsuccessful login" #testing
      render "new" #renders a different template within the same controller
    end  
  end
  
  def login
    @user = User.login
    redirect_to users_path
  end
  

  def destroy
    #ends the session var
    session[:user_id] = nil
    redirect_to root_url
    flash[:notice] = "You just logged out"
  end

end
