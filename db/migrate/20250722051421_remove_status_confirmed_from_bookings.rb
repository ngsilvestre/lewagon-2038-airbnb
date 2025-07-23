class RemoveStatusConfirmedFromBookings < ActiveRecord::Migration[7.1]
  def change
    remove_column :bookings, :status_confirmed
  end
end
