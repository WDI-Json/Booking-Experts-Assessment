Rails.application.routes.draw do
  resources :bookings
  devise_for :users
  resources :partners

  get "up" => "rails/health#show", as: :rails_health_check

  root "home#index"
end
