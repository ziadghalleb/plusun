class AddAttributesToBookings < ActiveRecord::Migration[5.2]
  def change
    add_column :bookings, :name, :string
    add_column :bookings, :start_date, :datetime
    add_column :bookings, :end_date, :datetime
    add_column :bookings, :total_price, :integer
    add_column :bookings, :status, :string
  end
end
