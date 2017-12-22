class CreateStoreBicycles < ActiveRecord::Migration
  def change
    create_table :store_bicycles do |t|
      t.string :name
    end
  end
end
