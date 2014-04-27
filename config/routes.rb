require "sidekiq/web"
require "admin_constraint"

Sani::Application.routes.draw do

  root "home#index"

  get "login"  => "sessions#index",  as: :login
  get "logout" => "sessions#destroy", as: :logout

  resources :users
  resources :sessions
  resources :models
  resources :businesses do
    resources :bandangos
    resources :transacciones
  end

  namespace :api do
    resources :transacciones
  end

  # sidekiq:
  mount Sidekiq::Web, at: "/_sidekiq", :constraints => AdminConstraint.new
end
