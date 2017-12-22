class StoreCar < ActiveRecord::Base
  belongs_to :store
  belongs_to :car
end
