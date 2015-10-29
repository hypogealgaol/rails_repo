class HomepageController < ApplicationController
  def new
  end

  def create
  end

  def index
  	 @user = User.find_by(email: params[:email])
  end
end
