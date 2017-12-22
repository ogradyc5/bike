class StoreBicycle < ActiveRecord::Base
  validates_uniqueness_of :bicycle_id, :scope => [:store_id]
  belongs_to :store  
  belongs_to :bicycle
  has_many :bookings
end
