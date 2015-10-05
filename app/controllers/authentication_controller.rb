class AuthenticationController < ApplicationController
  # "Delete" a login, aka "log the user out"

  def create
  	if user = User.authenticate(params[:username])
  		session[:current_user_id] = user.id
  		redirect_to 

  end



  def destroy
    # Remove the user id from the session
    @_current_user = session[:current_user_id] = nil
    flash[:notice] = "You logged out, bro"
    redirect_to root_url
  end
end