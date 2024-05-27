Rails.application.routes.draw do
  # Resources
  resources :partners
  resources :bookings do
    resource :invoice, only: [:new, :create]
    get 'get_invoice', to: 'bookings#get_invoice', as: :get_invoice
  end

  # Authentication
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  
  # Background jobs
  resources :jobs, only: [:create]
  # Routes
  get "up" => "rails/health#show", as: :rails_health_check
  get '/about', to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'
  get 'switch_locale/:locale', to: 'application#switch_locale', as: :switch_locale
  
  root "home#index"
end
