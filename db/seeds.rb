# ActiveRecord::Schema[7.1].define(version: 2025_07_18_041804) do
#   # These are extensions that must be enabled in order to support this database
#   enable_extension "plpgsql"

  # create_table "bookings", force: :cascade do |t|
  #   t.date "start_date"
  #   t.date "end_date"
  #   t.boolean "status_confirmed"
  #   t.bigint "listing_id", null: false
  #   t.bigint "user_id", null: false
  #   t.datetime "created_at", null: false
  #   t.datetime "updated_at", null: false
  #   t.index ["listing_id"], name: "index_bookings_on_listing_id"
  #   t.index ["user_id"], name: "index_bookings_on_user_id"
  # end

  # create_table "listings", force: :cascade do |t|
  #   t.string "location"
  #   t.float "price"
  #   t.integer "num_guests"
  #   t.text "description"
  #   t.datetime "created_at", null: false
  #   t.datetime "updated_at", null: false
  #   t.bigint "owner_id", null: false
  #   t.index ["owner_id"], name: "index_listings_on_owner_id"
  # end

  # create_table "users", force: :cascade do |t|
  #   t.string "email", default: "", null: false
  #   t.string "encrypted_password", default: "", null: false
  #   t.string "reset_password_token"
  #   t.datetime "reset_password_sent_at"
  #   t.datetime "remember_created_at"
  #   t.datetime "created_at", null: false
  #   t.datetime "updated_at", null: false
  #   t.index ["email"], name: "index_users_on_email", unique: true
  #   t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  # end

#   add_foreign_key "bookings", "listings"
#   add_foreign_key "bookings", "users"
#   add_foreign_key "listings", "users", column: "owner_id"
# end

# USERS
# User.destroy_all
norman = User.new(email: "norman@gmail.com", password: "123456")
norman.save
norman_listing = Listing.new(location: "Southbank", price: 50, num_guests: 4, description:"Cozy Apartment", owner_id: norman.id)
norman_listing.save

quinn = User.new(email: "quinn@gmail.com", password: "123456")
quinn.save
quinn_listing = Listing.new(location: "Waterloo", price: 100, num_guests: 2, description:"A unique inner city apartment", owner_id: quinn.id)
quinn_listing.save

mark = User.new(email: "mark@gmail.com", password: "123456")
mark.save
mark_listing = Listing.new(location: "Hobart", price: 80, num_guests: 2, description:"Relaxing picturesque abode", owner_id: mark.id)
mark_listing.save

dom = User.new(email: "dominique@gmail.com", password: "123456")
dom.save
dom_listing = Listing.new(location: "Windsor", price: 90, num_guests: 3, description:"Fancy place", owner_id: dom.id)
dom_listing.save

# Norman books Quinns listing
norman_booking = Booking.new(start_date: Date.new(2025, 7, 22), end_date: Date.new(2025, 7, 23), status_confirmed: true, listing_id: quinn_listing.id, user_id: norman.id)
norman_booking.save

# Quinn books Marks Listing
quinn_booking = Booking.new(start_date: Date.new(2025, 7, 24), end_date: Date.new(2025, 7, 25), status_confirmed: true, listing_id: mark_listing, user_id: quinn.id)
quinn_booking.save

# Mark books Quinns Listing
mark_booking = Booking.new(start_date: Date.new(2025, 7, 26), end_date: Date.new(2025, 7, 27), status_confirmed: true, listing_id: quinn_listing.id, user_id: mark.id)
mark_booking.save

# Dom books Quinns Listing
dom_booking = Booking.new(start_date: Date.new(2025, 7, 27), end_date: Date.new(2025, 7, 28), status_confirmed: true, listing_id: quinn_listing.id, user_id: dom.id)
dom_booking.save

# USER IDS
# Norman: 9
# Quinn: 10
# Mark: 11
# Dom:12

# Listing.create!(location: "Southbank", price: 50, num_guests: 4, description:"Cozy Apartment", owner_id: 9)
# Listing.create!(location: "Waterloo", price: 100, num_guests: 2, description:"A unique inner city apartment", owner_id: 10)
# Listing.create!(location: "Hobart", price: 80, num_guests: 2, description:"Relaxing picturesque abode", owner_id: 11)
# Listing.create!(location: "Windsor", price: 90, num_guests: 3, description:"Fancy place", owner_id: 12)


# Booking.create!(start_date: Date.new(2025, 7, 22), end_date: Date.new(2025, 7, 23), status_confirmed: true, listing_id: 2, user_id: 9)
#Booking.create!(start_date: Date.new(2025, 7, 24), end_date: Date.new(2025, 7, 25), status_confirmed: true, listing_id: 2, user_id: 10)
#Booking.create!(start_date: Date.new(2025, 7, 26), end_date: Date.new(2025, 7, 27), status_confirmed: true, listing_id: 2, user_id: 11)
#Booking.create!(start_date: Date.new(2025, 7, 26), end_date: Date.new(2025, 7, 27), status_confirmed: true, listing_id: 1, user_id: 10)
