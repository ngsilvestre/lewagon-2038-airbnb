class DashboardController < ApplicationController
  def listings
    @user_listings = Listing.where(owner_id: current_user.id)
  end
end
