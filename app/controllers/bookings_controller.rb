class BookingsController < ApplicationController
  def update
    @booking = Booking.find(params[:id])
    @booking.update(booking_params)
    redirect_to dashboard_listings_path
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to dashboard_bookings_path, status: :see_other
  end

  private

  def booking_params
    params.require(:booking).permit(:status_confirmed)
  end
end
