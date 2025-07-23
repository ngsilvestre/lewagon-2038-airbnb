# RESET DATA
User.destroy_all
Listing.destroy_all
Booking.destroy_all

norman_image_paths = [
  Rails.root.join("db/seeds_images/norman/photo1.jpeg"),
  Rails.root.join("db/seeds_images/norman/photo2.jpeg"),
  Rails.root.join("db/seeds_images/norman/photo3.jpeg")
]
quinn_image_paths = [
  Rails.root.join("db/seeds_images/quinn/photo1.jpeg"),
  Rails.root.join("db/seeds_images/quinn/photo2.jpeg"),
  Rails.root.join("db/seeds_images/quinn/photo3.jpeg")
]

mark_image_paths = [
  Rails.root.join("db/seeds_images/mark/photo1.jpeg"),
  Rails.root.join("db/seeds_images/mark/photo2.jpeg"),
  Rails.root.join("db/seeds_images/mark/photo3.jpeg")
]

dominique_image_paths = [
  Rails.root.join("db/seeds_images/dominique/photo1.jpeg"),
  Rails.root.join("db/seeds_images/dominique/photo2.jpeg"),
  Rails.root.join("db/seeds_images/dominique/photo3.jpeg")
]

george_image_paths = [
  Rails.root.join("db/seeds_images/george/photo1.jpeg"),
  Rails.root.join("db/seeds_images/george/photo2.jpeg"),
  Rails.root.join("db/seeds_images/george/photo3.jpeg")
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

norman = User.new(email: "norman@gmail.com", password: "123456")
norman.save
norman_listing = Listing.new(
  title: "Cozy Snowbound Chalet", location: "Zermatt Alps, Valais, Switzerland", price: 50, num_guests: 4, owner: norman,
  description: "Experience winter wonderland in this stylish chalet, just steps from the ski lifts. With underfloor heating, a hot tub on the deck, and champagne sunsets over the Matterhorn, this is alpine luxury at its best."
)
norman_listing.photos.attach(file_upload(norman_image_paths))
norman_listing.save

quinn = User.new(email: "quinn@gmail.com", password: "123456")
quinn.save
quinn_listing = Listing.new(
  title: "Cozy Cottage in a Greenfield", location: "Havenbrook, Somerset, England", price: 50, num_guests: 4, owner: quinn,
  description: "Charming 2‑bedroom cottage surrounded by rolling green fields — perfect for stargazing at night."
)
quinn_listing.photos.attach(file_upload(quinn_image_paths))
quinn_listing.save

mark = User.new(email: "mark@gmail.com", password: "123456")
mark.save
mark_listing = Listing.new(
  title: "Rustic Cabin Near the River", location: "Riverbend Lodge", price: 50, num_guests: 4, owner: mark,
  description: "Relax by the river in this wooden cabin with a private deck and electric fire pit."
)
mark_listing.photos.attach(file_upload(mark_image_paths))
mark_listing.save

dominique = User.new(email: "dominique@gmail.com", password: "123456")
dominique.save
dominique_listing = Listing.new(
  title: "Secluded Forest Hideaway", location: "Forest Haven", price: 50, num_guests: 4, owner: dominique,
  description: "Escape into nature in this modern treehouse nestled amid towering pines."
)
dominique_listing.photos.attach(file_upload(dominique_image_paths))
dominique_listing.save

george = User.new(email: "george@gmail.com", password: "123456")
george.save
george_listing = Listing.new(
  title: "By the Sea: Oceanfront Villa", location: "Coastal Breeze Villa", price: 70, num_guests: 4, owner: george,
  description: "Wake up to sunrise views over the ocean; private beach access included."
)
george_listing.photos.attach(file_upload(george_image_paths))
george_listing.save

# Norman books Quinns listing
norman_booking = Booking.new(start_date: Date.new(2025, 7, 22), end_date: Date.new(2025, 7, 23), listing: quinn_listing, user: norman)
norman_booking.save

# Quinn books Marks Listing
quinn_booking = Booking.new(start_date: Date.new(2025, 7, 24), end_date: Date.new(2025, 7, 25), listing: mark_listing, user: quinn)
quinn_booking.save

# Mark books Quinns Listing
mark_booking = Booking.new(start_date: Date.new(2025, 7, 26), end_date: Date.new(2025, 7, 27), listing: quinn_listing, user: mark)
mark_booking.save

# Dom books Quinns Listing
dominique_booking = Booking.new(start_date: Date.new(2025, 7, 27), end_date: Date.new(2025, 7, 28), listing: quinn_listing, user: dominique)
dominique_booking.save

# George books Marks Listing
george_booking = Booking.new(start_date: Date.new(2025, 7, 27), end_date: Date.new(2025, 7, 28), listing: mark_listing, user: george)
george_booking.save
