class Bicycle < ActiveRecord::Base
    validates :name, presence: true, uniqueness: true 
   
    has_many :stores, :through => :store_bicycles 
    has_many :bicycles, :through => :store_bicycles
    has_many :store_bicycles, :dependent => :destroy
    has_many :bookings, through: :store_bicycles
    acts_as_votable
    mount_uploader :image, ImageUploader
    
    #def self.search(search)  
     #   where("lower(stores.name) LIKE :search OR lower(bicycles.name) LIKE :search", search: "%#{search.downcase}%").uniq   
    #end
    
    def self.search(search)  
        where("lower(name) LIKE ?", "%#{search.downcase}%")
    end
end
