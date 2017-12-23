class BookingsController < ApplicationController
  respond_to :html, :xml, :json
  before_action :find_store
  before_action :find_store_bicycle

  def index
    @bookings = Booking.where("store_bicycle_id = ? AND end_time >= ?", @store_bicycle.id, Time.now).order(:start_time)
    respond_with @bookings
  end

  def new
    @booking = Booking.new(store_bicycle_id: @store_bicycle.id)
  end

  def create
    @booking =  Booking.new(params[:booking].permit(:store_bicycle_id, :start_time, :length).merge(user_id: current_user.id))
    @booking.store_bicycle = @store_bicycle
    if @booking.save
      @booking.create_activity :create, owner: current_user
      redirect_to store_bicycle_bookings_path(@store_bicycle, method: :get)
    else
      render 'new'
    end
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def destroy
    @booking = Booking.find(params[:id]).destroy
    if @booking.destroy
      @booking.create_activity :destroy, owner: current_user
      flash[:notice] = "Booking: #{@booking.start_time.strftime('%e %b %Y %H:%M%p')} to #{@booking.end_time.strftime('%e %b %Y %H:%M%p')} deleted"
      redirect_to store_bicycle_bookings_path(@store_bicycle)
    else
      render 'index'
    end
  end

  def edit
    @booking = Booking.find(params[:id])
  end

  def update
    @booking = Booking.find(params[:id])
    # @booking.store_bicycles = @store_bicycles

    if @booking.update(params[:booking].permit(:store_bicycle_id, :start_time, :length))
      @booking.create_activity :update, owner: current_user
      flash[:notice] = 'Your booking was updated succesfully'

      if request.xhr?
        render json: {status: :success}.to_json
      else
        redirect_to store_bicycle_bookings_path(@store_bicycle)
      end
    else
      render 'edit'
    end
  end

  private

  def save booking
    if @booking.save
        flash[:notice] = 'booking added'
        redirect_to store_bicycle_booking_path(@store_bicycle, @booking)
      else
        render 'new'
      end
  end

  def find_store_bicycle
    if params[:store_bicycle_id]
      @store_bicycle = StoreBicycle.find_by_id(params[:store_bicycle_id])
    end
  end
  
  def find_store  
    if params[:store_id]  
      @store = Store.find_by_id(params[:store_id])  
    end
  end

end
