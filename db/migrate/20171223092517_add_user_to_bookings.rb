class AddUserToBookings < ActiveRecord::Migration
  def change
    add_reference :bookings, :user, index: true, foreign_key: true
    add_column :bookings, :created_at, :datetime
    add_column :bookings, :updated_at, :datetime
  end
end
