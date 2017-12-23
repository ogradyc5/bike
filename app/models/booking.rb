require_relative './concerns/bookable'

class Booking < ActiveRecord::Base
  include Bookable
  belongs_to :user
  belongs_to :store_bicycle
  include PublicActivity::Common
  #tracked owner: ->(controller, model) { controller && controller.current_user }
  def sum_price
    if store_bicycle.bicycle.price.present?
     
      @sum_price = length * store_bicycle.bicycle.price
    else
      print "No defined price for this bike"
    end
  end
  
  def require_same_user
    if current_user != @booking.user and !current_user.admin?
    flash[:danger] = "You can only edit or delete your own bikes"
    redirect_to root_path
    end
  end
  
end