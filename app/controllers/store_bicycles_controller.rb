class StoreBicyclesController < ApplicationController
  before_action :find_store
  #before_action :set_store_bicycle, only: [:show, :edit, :update, :destroy]
  

  def index  
    if @store.nil?  
      @store_bicycles = StoreBicycle.all  
    else
      @store_bicycles = StoreBicycle.where("store_id = ?", @store)  
    end  
  end  
  
  def find_store  
    if params[:store_id]  
      @store = Store.find_by_id(params[:store_id])  
    end  
  end

  def search
    if params[:storebicycle].blank?
        flash.now[:danger] = "You have entered an empty search"
    else
        @storebicycle = StoreBicycle.new_from_lookup(params[:storebicycle])
        flash.now[:danger] = "You have entered an invalid search" unless
      @storebicycle
    end
    render partial: 'users/result'
  end
  
  def new
    @store_bicycle = StoreBicycle.new
  end

  def create
    @store_bicycle = StoreBicycle.create(store_bicycle_params)
    if @store_bicycle.save
      redirect_to store_bicycles_path
    else
      render 'new'
      flash[:error] = "Unable to create store bicycle. Please try again"
    end
  end

  def destroy
    @store_bicycle = StoreBicycle.find(params[:id])
    @store_bicycle.destroy
    redirect_to store_bicycles_path
  end

  def edit
    @store_bicycle = StoreBicycle.find(params[:id])
  end

  def update
    @store_bicycle = StoreBicycle.find(params[:id])
    @store_bicycle.update store_bicycle_params
    if @store_bicycle.save
      flash[:notice] = "Your store bicycle was updated succesfully"
      redirect_to root_path
    else
      render 'edit'
    end
  end

  private

    def store_bicycle_params
      params.require(:store_bicycle).permit(:name, :delete)
    end
    def store_bicycle_params
      params.require(:store_bicycle).permit(:store_id, :bicycle_id)
    end


end
