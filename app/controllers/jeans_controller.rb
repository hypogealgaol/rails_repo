class JeansController < ApplicationController
  before_action :set_jeans, only: [:show, :edit, :update, :destroy]

  # GET /jeans
  # GET /jeans.json
  def index
    @jeans = Jeans.all
  end

  # GET /jeans/1
  # GET /jeans/1.json
  def show
  end

  # GET /jeans/new
  def new
    @jeans = Jeans.new
  end

  # GET /jeans/1/edit
  def edit
  end

  # POST /jeans
  # POST /jeans.json
  def create
    @jeans = Jeans.new(jeans_params)

    respond_to do |format|
      if @jeans.save
        format.html { redirect_to @jeans, notice: 'Jeans was successfully created.' }
        format.json { render :show, status: :created, location: @jeans }
      else
        format.html { render :new }
        format.json { render json: @jeans.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /jeans/1
  # PATCH/PUT /jeans/1.json
  def update
    respond_to do |format|
      if @jeans.update(jeans_params)
        format.html { redirect_to @jeans, notice: 'Jeans was successfully updated.' }
        format.json { render :show, status: :ok, location: @jeans }
      else
        format.html { render :edit }
        format.json { render json: @jeans.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /jeans/1
  # DELETE /jeans/1.json
  def destroy
    @jeans.destroy
    respond_to do |format|
      format.html { redirect_to jeans_index_url, notice: 'Jeans was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_jeans
      @jeans = Jeans.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def jeans_params
      params.require(:jeans).permit(:maker, :denim, :color)
    end
end
