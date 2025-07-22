class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    @listing = Listing.find(params[:listing_id]) if params[:listing_id]
  end

  # POST /listings/:listing_id/bookings
  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.listing = Listing.find(params[:listing_id])

    if @booking.save
      redirect_to @booking.listing, notice: "Booking created successfully!"
    else
      flash.now[:alert] = "There were errors with your booking."
      render :new, status: :unprocessable_entity
    end
  end

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
    params.require(:booking).permit(:status_confirmed, :start_date, :end_date, :guests)
  end
end
