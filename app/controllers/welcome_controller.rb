class WelcomeController < ApplicationController
  include SessionsHelper
  skip_before_filter :require_user

  def index

  end
end
