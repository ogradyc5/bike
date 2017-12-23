class AddIdsToStoreBicycles < ActiveRecord::Migration
  def change
    change_table :store_bicycles do |t|
      t.references :store, index: true, foreign_key: true
      t.references :bicycle, index: true, foreign_key: true
    end
  end
end
