class GyrosController < ApplicationController
  respond_to :html, :xml, :json
  before_action :set_gyro, only: [:show, :edit, :update, :destroy]

  # GET /gyros
  # GET /gyros.json
  def index
    @gyros = Gyro.all
  end

  # GET /gyros/1
  # GET /gyros/1.json
  def show
  end

  # GET /gyros/new
  def new
    @gyro = Gyro.find(params[:id]) #params[:id] is a placeholder for now until i figure out what the user params are
  end

  # GET /gyros/1/edit
  def edit
  end

  # POST /gyros
  # POST /gyros.json
  def create
    @gyro = Gyro.new(gyro_params)

    respond_to do |format|
      if @gyro.save
        format.html { redirect_to @gyro, notice: 'Gyro was successfully created.' }
        format.json { render :show, status: :created, location: @gyro }
      else
        format.html { render :new }
        format.json { render json: @gyro.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /gyros/1
  # PATCH/PUT /gyros/1.json
  def update
    respond_to do |format|
      if @gyro.update(gyro_params)
        format.html { redirect_to @gyro, notice: 'Gyro was successfully updated.' }
        format.json { render :show, status: :ok, location: @gyro }
      else
        format.html { render :edit }
        format.json { render json: @gyro.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gyros/1
  # DELETE /gyros/1.json
  def destroy
    @gyro.destroy
    respond_to do |format|
      format.html { redirect_to gyros_url, notice: 'Gyro was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gyro
      @gyro = Gyro.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def gyro_params
      params.require(:gyro).permit(:user_id, :type, :tomato)
    end
end
