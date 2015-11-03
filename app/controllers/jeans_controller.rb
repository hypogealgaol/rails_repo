class JeansController < ApplicationController
  before_action :set_jean, only: [:show, :edit, :update, :destroy]

  # GET /jeans
  # GET /jeans.json
  def index
    if logged_in?
      @jeans = current_user.jeans
    end
    @jean = Jean.new
  end

  # GET /jeans/1
  # GET /jeans/1.json
  def show
  end

  # GET /jeans/new
  def new
    @jean = Jean.new
    @jean.user = current_user

  end

  # GET /jeans/1/edit
  def edit
  end

  # POST /jeans
  # POST /jeans.json
  def create
    @jean = Jean.new(jean_params)

    respond_to do |format|
      if @jean.save
        format.html { redirect_to @jean, notice: 'Jeans was successfully created.' }
        format.json { render :show, status: :created, location: @jeans }
      else
        format.html { render :new }
        format.json { render json: @jean.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /jeans/1
  # PATCH/PUT /jeans/1.json
  def update
    respond_to do |format|
      if @jean.update(jeans_params)
        format.html { redirect_to @jean, notice: 'Jeans was successfully updated.' }
        format.json { render :show, status: :ok, location: @jean }
      else
        format.html { render :edit }
        format.json { render json: @jean.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /jeans/1
  # DELETE /jeans/1.json
  def destroy
    @jean.destroy
    respond_to do |format|
      format.html { redirect_to jean_index_url, notice: 'Jeans was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_jean
      @jean = Jeans.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def jean_params
      params.require(:jean).permit(:maker, :denim, :color)
    end
end
