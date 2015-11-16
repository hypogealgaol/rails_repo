class PantsController < ApplicationController
  before_action :set_pant, only: [:show, :edit, :update, :destroy]
  before_filter :load_parent


  # GET /pants
  # GET /pants.json
  def index
    @pants = @user.pants.all
  end

  # GET /pants/1
  # GET /pants/1.json
  def show
    @pant = @user.pants.find(params[:id])

  end

  # GET /pants/new
  def new
    @pant = @user.pants.new
  end

  # GET /pants/1/edit
  def edit
  end

  # POST /pants
  # POST /pants.json
  def create
    @pant = @user.pants.build(pant_params)


    respond_to do |format|
      if @pant.save
        format.html { redirect_to [@user, @pant], notice: 'Pant was successfully created.' }
        format.json { render :show, status: :created, location: @pant }
      else
        format.html { render :new }
        format.json { render json: @pant.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pants/1
  # PATCH/PUT /pants/1.json
  def update
    respond_to do |format|
      if @pant.update(pant_params)
        format.html { redirect_to @pant, notice: 'Pant was successfully updated.' }
        format.json { render :show, status: :ok, location: @pant }
      else
        format.html { render :edit }
        format.json { render json: @pant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pants/1
  # DELETE /pants/1.json
  def destroy
    @pant.destroy
    respond_to do |format|
      format.html { redirect_to pants_url, notice: 'Pant was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pant
      @pant = Pant.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pant_params
      params.require(:pant).permit(:maker, :quality)
    end

    def load_parent
      @user = current_user
    end
end
