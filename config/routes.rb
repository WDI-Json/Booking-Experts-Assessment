Rails.application.routes.draw do
  # Resources
  resources :partners
  resources :bookings do
    resource :invoice, only: [:new, :create]
  end

  # Authentication
  devise_for :users
  # Routes
  get "up" => "rails/health#show", as: :rails_health_check

  root "home#index"
end
