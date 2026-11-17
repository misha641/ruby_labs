
Rails.application.routes.draw do
  devise_for :users

  root "medicines#index"

  get "profile", to: "profiles#show", as: :profile
  get "pages/about"

  delete "medicines/delete_all",
         to: "medicines#delete_all",
         as: :delete_all_medicines

  resources :medicines

  get "hi/index"
  get "up" => "rails/health#show", as: :rails_health_check
end
