class BookingsController < ApplicationController
  # GET /listings/:listing_id/bookings
  def index
    @listing = Listing.find(params[:listing_id]) if params[:listing_id]
  end

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
      redirect_to @booking, notice: "Booking successfully created!"

    else
      flash.now[:alert] = "There were errors with your booking."
      # render :new, status: :unprocessable_entity
      render "listings/show", status: :unprocessable_entity

    end
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def update
    @booking = Booking.find(params[:id])
    @booking.update(booking_params)
    redirect_to listing_bookings_path(@booking.listing)
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to dashboard_bookings_path, status: :see_other
  end

  private

  def booking_params
    params.require(:booking).permit(:status, :start_date, :end_date, :guests)
  end
end
