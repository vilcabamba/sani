Sani::Application.routes.draw do
  
  root "home#index"

  get "login"  => "sessions#index",  as: :login
  get "logout" => "sessions#destroy", as: :logout
  resources :sessions

  namespace :api do
    resources :transacciones
  end
end
