class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.string :topic
      t.references :user_seeker
      t.references :user_guide

      t.timestamps
    end
    add_foreign_key :bookings, :users, column: :user_seeker_id, primary_key: :id
    add_foreign_key :bookings, :users, column: :user_guide_id, primary_key: :id
  end
end
