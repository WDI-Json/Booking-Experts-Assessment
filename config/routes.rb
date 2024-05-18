Rails.application.routes.draw do
  resources :partners

  get "up" => "rails/health#show", as: :rails_health_check
end
