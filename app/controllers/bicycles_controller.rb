class BicyclesController < ApplicationController
  before_action :set_bicycle, only: [:show, :edit, :update, :destroy, :upvote, :downvote]
  

  def index
    @bicycles = Bicycle.all.order(:cached_votes_score => :desc)
  end

  def show
    @bicycle = Bicycle.find(params[:id])
  end
  
  
  
  def list
    @bookings = @user.bookings.all if @user
  end 

  def new
    @bicycle = Bicycle.new
  end

  def edit
  end
  
 
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

  def destroy
    @bicycle.destroy
    respond_to do |format|
      format.html { redirect_to bicycles_url }
      format.json { head :no_content }
    end
  end

  
  def upvote
    @bicycle.upvote_from current_user
    redirect_to bicycles_path
  end 

  def downvote
    @bicycle.downvote_from current_user
    redirect_to bicycles_path
  end




  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bicycle
      @bicycle = Bicycle.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bicycle_params
      params.require(:bicycle).permit(:name, :price, :image, :remove_image)
    end
end
