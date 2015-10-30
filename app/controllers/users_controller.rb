class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy] #before a user is created we don't want to show edit update destr
  before_filter :require_user, :except => [:create, :new]
  
  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show #sss2208
    @user = User.find(params[:id])
  end

  def homepage
    @user = User.find_by(email: session[:user_email])
  end
  

  # GET /users/new
  def new
    @user = User.new
  end

  def show_jeans
    
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    puts "[USER_CONTROLLER] create"
    @user = User.new(user_params)
    #set default privilege. anyone named sinjihn is an admin
    if(@user.first_name == "sinjihn")
      puts "[USER_CONTROLLER] admin privileges accepted"
      @user.update_attribute(:privilege, true)
    else 
      @user.update_attribute(:privilege, false)
    end

    respond_to do |format|
      if @user.save #if succesfully saved to db
        puts "[USER_CONTROLLER] user.save" 
        log_in @user
        format.html { redirect_to @user, success: 'User was successfully created. Automatically logged in' }
        format.json { render :show, status: :created, location: @user } #should render homepage
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update

    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: '' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation) #password?
    end
end
