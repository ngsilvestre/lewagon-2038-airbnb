Rails.application.routes.draw do
  devise_for :users
  resources :listings
  root to: "listings#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  get "dashboard/listings", to: "dashboard#listings", as: :dashboard_listings
  get "dashboard/bookings", to: "dashboard#bookings", as: :dashboard_bookings
<<<<<<< HEAD
=======
  patch "bookings/:id", to: "bookings#update", as: :booking
  delete "bookings/:id", to: "bookings#destroy"
>>>>>>> 002aa9475bd50332ddd05ec9d8637c227b022075
end
