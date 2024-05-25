Rails.application.routes.draw do
  # Resources
  resources :partners
  resources :bookings do
    resource :invoice, only: [:new, :create]
    get 'get_invoice', to: 'bookings#get_invoice', as: :get_invoice
  end

  # Authentication
  devise_for :users
  # Routes
  get "up" => "rails/health#show", as: :rails_health_check

  get '/about', to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'
  root "home#index"
end
