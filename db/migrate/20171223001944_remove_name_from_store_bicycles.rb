class RemoveNameFromStoreBicycles < ActiveRecord::Migration
  def change
    remove_column :store_bicycles, :name
    
  end
end
