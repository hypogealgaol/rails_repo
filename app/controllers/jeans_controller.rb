class JeansController < ApplicationController
  before_action :set_jean, only: [:show, :edit, :update, :destroy]
  before_filter :require_user, :except => [:create, :new]


  # GET /jeans_paramss
  # GET /jeans.json
  def index
    @jeans = current_user.jeans.all
  end

  # GET /jeans/1
  # GET /jeans/1.json
  def show
  end

  # GET /jeans/new
  def new
    @jean = Jean.new
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
        format.html { redirect_to @jean, notice: 'Jean was successfully created.' }
        format.json { render :show, status: :created, location: @jean }
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
      if @jean.update(jean_params)
        format.html { redirect_to @jean, notice: 'Jean was successfully updated.' }
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
      format.html { redirect_to jeans_url, notice: 'Jean was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_jean
      @jean = Jean.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def jean_params
      params.require(:jean).permit(:maker, :denim)
    end
end
