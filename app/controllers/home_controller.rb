class HomeController < ApplicationController

	skip_before_filter :require_user, :only => [:new, :create]

	def new
	end

	def create
	end

	def destroy
	end 
end
