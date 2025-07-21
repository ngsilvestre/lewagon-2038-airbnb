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
norman_booking = Booking.new(start_date: Date.new(2025, 7, 22), end_date: Date.new(2025, 7, 23), status_confirmed: true, listing: quinn_listing, user: norman)
norman_booking.save

# Quinn books Marks Listing
quinn_booking = Booking.new(start_date: Date.new(2025, 7, 24), end_date: Date.new(2025, 7, 25), status_confirmed: true, listing: mark_listing, user: quinn)
quinn_booking.save

# Mark books Quinns Listing
mark_booking = Booking.new(start_date: Date.new(2025, 7, 26), end_date: Date.new(2025, 7, 27), status_confirmed: true, listing: quinn_listing, user: mark)
mark_booking.save

# Dom books Quinns Listing
dom_booking = Booking.new(start_date: Date.new(2025, 7, 27), end_date: Date.new(2025, 7, 28), status_confirmed: true, listing: quinn_listing, user: dom)
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
#gBooking.create!(start_date: Date.new(2025, 7, 26), end_date: Date.new(2025, 7, 27), status_confirmed: true, listing_id: 1, user_id: 10)
