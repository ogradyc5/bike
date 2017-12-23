class Store < ActiveRecord::Base
    has_many :bicycles, :through => :store_bicycles  
    has_many :store_bicycles, :dependent => :destroy
    #mount_uploader :image, ImageUploader
end