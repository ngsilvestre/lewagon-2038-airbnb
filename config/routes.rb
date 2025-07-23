Rails.application.routes.draw do
  devise_for :users
  resources :listings do
    member do
      delete 'delete_photo/:photo_id', to: 'listings#delete_photo', as: 'delete_photo'
    end
  end
  root to: "listings#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  get "dashboard/listings", to: "dashboard#listings", as: :dashboard_listings
  get "dashboard/bookings", to: "dashboard#bookings", as: :dashboard_bookings
  resources :listings do
    resources :bookings, only: %i(new create)
  end
  resources :bookings, only: %i(update show destroy)
end
