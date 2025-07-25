class DashboardController < ApplicationController
  def listings
    @user_listings = Listing.where(owner: current_user)
  end

  def bookings
    @user_bookings = Booking.where(user: current_user)
  end

  def profile
  end
end
