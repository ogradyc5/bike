class BicyclesController < ApplicationController
  before_action :set_bicycle, only: [:show, :edit, :update, :destroy]

  # GET /bicycles
  # GET /bicycles.json
  def index
    @bicycles = Bicycle.all
  end

  # GET /bicycles/1
  # GET /bicycles/1.json
  def show
  end

  # GET /bicycles/new
  def new
    @bicycle = Bicycle.new
  end

  # GET /bicycles/1/edit
  def edit
  end

  # POST /bicycles
  # POST /bicycles.json
  def create
    @bicycle = Bicycle.new(bicycle_params)

    respond_to do |format|
      if @bicycle.save
        format.html { redirect_to @bicycle, notice: 'Bicycle was successfully created.' }
        format.json { render action: 'show', status: :created, location: @bicycle }
      else
        format.html { render action: 'new' }
        format.json { render json: @bicycle.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bicycles/1
  # PATCH/PUT /bicycles/1.json
  def update
    respond_to do |format|
      if @bicycle.update(bicycle_params)
        format.html { redirect_to @bicycle, notice: 'Bicycle was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @bicycle.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bicycles/1
  # DELETE /bicycles/1.json
  def destroy
    @bicycle.destroy
    respond_to do |format|
      format.html { redirect_to bicycles_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bicycle
      @bicycle = Bicycle.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bicycle_params
      params.require(:bicycle).permit(:name, :price, :image)
    end
end
