class DashboardController < ApplicationController
  def listings
    @user_listings = Listing.where(owner_id: current_user.id)
  end

  def bookings
    @user_bookings = Booking.where(user_id: current_user.id)
  end
end
