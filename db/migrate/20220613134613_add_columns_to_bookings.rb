class AddColumnsToBookings < ActiveRecord::Migration[7.0]
  def change
    add_column :bookings, :provider, :string
    add_column :bookings, :price, :string
    add_column :bookings, :url, :string
    add_column :bookings, :notes, :string
  end
end
