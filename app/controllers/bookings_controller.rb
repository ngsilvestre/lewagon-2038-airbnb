class BookingsController < ApplicationController
  before_action :set_listing, only: [:index, :new, :create]
  before_action :set_booking, only: %i[show update destroy]

  # GET /listings/:listing_id/bookings
  def index
    @pending_bookings   = @listing.bookings.where(status: :pending)
    @confirmed_bookings = @listing.bookings.where(status: :confirmed)
    @denied_bookings    = @listing.bookings.where(status: :denied)
  end

  # GET /listings/:listing_id/bookings/new
  def new
    @booking = Booking.new
    @start_date = params[:start_date]&.to_date
    @end_date   = params[:end_date]&.to_date
  end

  # POST /listings/:listing_id/bookings
  def create
    @booking = @listing.bookings.build(booking_params)
    @booking.user = current_user

    if @booking.save
      redirect_to booking_path(@booking), notice: "Booking successfully created!"
    else
      flash.now[:alert] = "There were errors with your booking."
      render "listings/show", status: :unprocessable_entity
    end
  end

  def show
  end

  def update
    if @booking.update(status_params)
      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to listing_bookings_path(@listing), notice: "Booking status updated!" }
      end
    else
      respond_to do |format|
        format.turbo_stream { render turbo_stream: turbo_stream.replace(dom_id(@booking), partial: "booking", locals: { booking: @booking }) }
        format.html { redirect_to listing_bookings_path(@listing), alert: "Failed to update status." }
      end
    end
  end

  def destroy
    @booking.destroy
    redirect_to listing_bookings_path(@listing), status: :see_other, notice: "Booking deleted."
  end

  private

  def set_listing
    @listing = Listing.find(params[:listing_id])
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :guests)
  end

  def status_params
    params.require(:booking).permit(:status)
  end
end
