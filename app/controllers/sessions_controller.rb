class SessionsController < ApplicationController
  include SessionsHelper

  before_filter :require_user, :except => [:new, :create]

  def new
    puts "[SESSIONS_CONTROLLER] new"

  end

  def create #login post
    puts "[SESSIONS_CONTROLLER] create"
    user = User.find_by(email: params[:session][:email], password_digest: params[:session][:password])
    if user && user.authenticate(params[:session][:password]) #authenticate the password
      puts 'logging in user'
      log_in user
      redirect_to :controller => 'users', :action => 'homepage', :user => user
    else
      puts "[ERROR] Bad Login"
      flash[:notice] = "Login Unsuccessful"
      render 'new' #renders a different template within the same controller
    end  
  end
  

  def destroy
    #ends the session var
    log_out
    redirect_to root_url
    flash[:notice] = "You just logged out"
  end

end
