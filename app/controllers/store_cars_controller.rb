class StoreCarsController < ApplicationController
  before_action :set_store_car, only: [:show, :edit, :update, :destroy]

  # GET /store_cars
  # GET /store_cars.json
  def index
    @store_cars = StoreCar.all
  end

  # GET /store_cars/1
  # GET /store_cars/1.json
  def show
  end

  # GET /store_cars/new
  def new
    @store_car = StoreCar.new
  end

  # GET /store_cars/1/edit
  def edit
  end

  # POST /store_cars
  # POST /store_cars.json
  def create
    @store_car = StoreCar.new(store_car_params)

    respond_to do |format|
      if @store_car.save
        format.html { redirect_to @store_car, notice: 'Store car was successfully created.' }
        format.json { render action: 'show', status: :created, location: @store_car }
      else
        format.html { render action: 'new' }
        format.json { render json: @store_car.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /store_cars/1
  # PATCH/PUT /store_cars/1.json
  def update
    respond_to do |format|
      if @store_car.update(store_car_params)
        format.html { redirect_to @store_car, notice: 'Store car was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @store_car.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /store_cars/1
  # DELETE /store_cars/1.json
  def destroy
    @store_car.destroy
    respond_to do |format|
      format.html { redirect_to store_cars_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_store_car
      @store_car = StoreCar.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def store_car_params
      params.require(:store_car).permit(:store_id, :car_id)
    end
end
