class SessionsController < ApplicationController
  include SessionsHelper

  skip_before_filter :require_user, :only => [:new, :create, :login]

  def new
    #@user = User.new
  end

  def create #login post
    user = User.find_by(email: params[:session][:email], password: params[:session][:password])
    if user
      log_in user
      redirect_to user
    else
      flash[:notice] = "Unsuccessful login"
      puts "unsuccessful login" #testing
      render 'new' #renders a different template within the same controller
    end  
  end
  

  def destroy
    #ends the session var
    session[:user_id] = nil
    session[:user_email] = nil
    redirect_to root_url
    flash[:notice] = "You just logged out"
  end

end
