class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    @listing = Listing.find(params[:listing_id]) if params[:listing_id]
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.listing = Listing.find(params[:listing_id]) if params[:listing_id]

    if @booking.save
      redirect_to @booking, notice: "Booking created successfully!"
    else
      flash.now[:alert] = "There were errors with your booking."
      render :new, status: :unprocessable_entity
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :guests)
  end
end
