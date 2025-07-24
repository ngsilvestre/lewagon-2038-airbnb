# RESET DATA
User.destroy_all
Listing.destroy_all
Booking.destroy_all

norman_image_paths = [
  Rails.root.join("db/seeds_images/norman/photo1.webp"),
  Rails.root.join("db/seeds_images/norman/photo2.webp"),
  Rails.root.join("db/seeds_images/norman/photo3.webp")
]
quinn_image_paths = [
  Rails.root.join("db/seeds_images/quinn/photo1.webp"),
  Rails.root.join("db/seeds_images/quinn/photo2.webp"),
  Rails.root.join("db/seeds_images/quinn/photo3.webp")
]

mark_image_paths = [
  Rails.root.join("db/seeds_images/mark/photo1.webp"),
  Rails.root.join("db/seeds_images/mark/photo2.webp"),
  Rails.root.join("db/seeds_images/mark/photo3.webp")
]

dominique_image_paths = [
  Rails.root.join("db/seeds_images/dominique/photo1.webp"),
  Rails.root.join("db/seeds_images/dominique/photo2.webp"),
  Rails.root.join("db/seeds_images/dominique/photo3.webp")
]

george_image_paths = [
  Rails.root.join("db/seeds_images/george/photo1.webp"),
  Rails.root.join("db/seeds_images/george/photo2.webp"),
  Rails.root.join("db/seeds_images/george/photo3.webp")
]

def file_upload(image_paths)
  image_paths.map do |path|
    {
      io: File.open(path),
      filename: File.basename(path),
      content_type: Mime::Type.lookup_by_extension(path.extname.delete('.')).to_s
    }
  end
end

puts "creating norman"
norman = User.new(email: "norman@gmail.com", password: "123456")
norman.save
puts "creating norman's listing"
norman_listing = Listing.new(
  title: "Cozy Snowbound Chalet", location: "Zermatt Alps, Valais, Switzerland", price: 50, num_guests: 4, owner: norman, rating: 4.8,
  description: "Experience winter wonderland in this stylish chalet, just steps from the ski lifts. With underfloor heating, a hot tub on the deck, and champagne sunsets over the Matterhorn, this is alpine luxury at its best."
)
norman_listing.photos.attach(file_upload(norman_image_paths))
norman_listing.save

puts "creating quinn"
quinn = User.new(email: "quinn@gmail.com", password: "123456")
quinn.save
puts "creating quinn's listing"
quinn_listing = Listing.new(
  title: "Cozy Cottage in a Greenfield", location: "Havenbrook, Somerset, England", price: 50, num_guests: 4, owner: quinn, rating: 5,
  description: "Charming 2‑bedroom cottage surrounded by rolling green fields — perfect for stargazing at night."
)
quinn_listing.photos.attach(file_upload(quinn_image_paths))
quinn_listing.save

puts "creating mark"
mark = User.new(email: "mark@gmail.com", password: "123456")
mark.save
puts "creating mark's listing"
mark_listing = Listing.new(
  title: "Rustic Cabin Near the River", location: "Riverbend Lodge", price: 50, num_guests: 4, owner: mark, rating: 5,
  description: "Relax by the river in this wooden cabin with a private deck and electric fire pit."
)
mark_listing.photos.attach(file_upload(mark_image_paths))
mark_listing.save

puts "creating dominique"
dominique = User.new(email: "dominique@gmail.com", password: "123456")
dominique.save
puts "creating dominique's listing"
dominique_listing = Listing.new(
  title: "Secluded Forest Hideaway", location: "Forest Haven", price: 50, num_guests: 4, owner: dominique, rating: 5,
  description: "Escape into nature in this modern treehouse nestled amid towering pines."
)
dominique_listing.photos.attach(file_upload(dominique_image_paths))
dominique_listing.save

puts "creating george"
george = User.new(email: "george@gmail.com", password: "123456")
george.save
puts "creating george's listing"
george_listing = Listing.new(
  title: "By the Sea: Oceanfront Villa", location: "Coastal Breeze Villa", price: 70, num_guests: 4, owner: george, rating: 5,
  description: "Wake up to sunrise views over the ocean; private beach access included."
)
george_listing.photos.attach(file_upload(george_image_paths))
george_listing.save

# Norman books Quinns listing
puts "creating norman's booking"
norman_booking = Booking.new(start_date: Date.new(2025, 7, 22), end_date: Date.new(2025, 7, 23), listing: quinn_listing, user: norman)
norman_booking.save

# Quinn books Marks Listing
puts "creating quinn's booking"
quinn_booking = Booking.new(start_date: Date.new(2025, 7, 24), end_date: Date.new(2025, 7, 25), listing: mark_listing, user: quinn)
quinn_booking.save

# Mark books Quinns Listing
puts "creating mark's booking"
mark_booking = Booking.new(start_date: Date.new(2025, 7, 26), end_date: Date.new(2025, 7, 27), listing: quinn_listing, user: mark)
mark_booking.save

# Dom books Quinns Listing
puts "creating dominique's booking"
dominique_booking = Booking.new(start_date: Date.new(2025, 7, 27), end_date: Date.new(2025, 7, 28), listing: quinn_listing, user: dominique)
dominique_booking.save

# George books Marks Listing
puts "creating george's booking"
george_booking = Booking.new(start_date: Date.new(2025, 7, 27), end_date: Date.new(2025, 7, 28), listing: mark_listing, user: george)
george_booking.save
