class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  include SessionsHelper
  #protect_from_forgery with: :exception #from https://www.railstutorial.org/book/log_in_log_out
  before_filter :require_user
  
  def require_user
    if current_user
      return true
    end
    redirect_to root_url
  end
end