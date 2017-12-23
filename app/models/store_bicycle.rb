class StoreBicycle < ActiveRecord::Base
  validates_uniqueness_of :bicycle_id, :scope => [:store_id]
  belongs_to :store  
  belongs_to :bicycle
  has_many :bookings, dependent: :destroy
  has_many :users, through: :bookings
  
  def self.find_by_store_bicycle_id(store_bicycle_id)
      where(id: store_bicycle_id).first
  end

  
  def self.new_from_lookup(search) 
    begin
      #looked_up_storebike = where("storebikes.id LIKE :search", search: "%#{search}%").uniq
      looked_up_storebicycle = StoreBicycle.find_by(:id => search)
      #new(name: looked_up_storebike.bike.name) #bike: looked_up_storebike.bike.bike_id)
    rescue Exception => e
      return nil
    end
  end
  

  def self.strip_commas(number)
    number.gsub(",", "")
  end
end
