class ListingsController < ApplicationController

  before_action :set_listings, only: %i[ show edit update destroy ]
  skip_before_action :authenticate_user!, only: %i[index show]
  # GET /listings or /listings.json
  def index
    @query = params[:query]
    @listings = if @query.present?
      Listing.where("location ILIKE ?", "%#{@query}%")
    else
      Listing.all
    end
  end

  # GET /listings/1 or /listings/1.json
  def show
  end

  # GET /listings/new
  def new
    @listing = Listing.new
  end

  # GET /listings/1/edit
  def edit
  end

  # POST /listings or /listings.json
  def create
    @listing = Listing.new(listing_params)
    @listing.owner = current_user
    respond_to do |format|
      if @listing.save
        format.html { redirect_to @listing, notice: "Listingzzz was successfully created." }
        format.json { render :show, status: :created, location: @listing }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /listings/1 or /listings/1.json
  def update
    respond_to do |format|
      if @listing.update(listing_params)
        format.html { redirect_to @listing, notice: "Listingzzz was successfully updated." }
        format.json { render :show, status: :ok, location: @listing }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /listings/1 or /listings/1.json
  def destroy
    @listing.destroy!

    respond_to do |format|
      format.html { redirect_to listings_path, status: :see_other, notice: "Listingzzz was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def delete_photo
    @listing = Listing.find(params[:id])
    photo = @listing.photos.find(params[:photo_id])
    photo.purge # or purge_later if you want it done in the background
    redirect_to @listing, notice: 'Photo was successfully deleted.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_listings
      @listing = Listing.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def listing_params
      params.require(:listing).permit(:location, :price, :num_guests, :owner, :description, photos: [])
    end


end
