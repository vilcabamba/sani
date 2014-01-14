require "sidekiq/web"
require "admin_constraint"

Sani::Application.routes.draw do
  
  root "home#index"

  get "login"  => "sessions#index",  as: :login
  get "logout" => "sessions#destroy", as: :logout
  
  resources :users
  resources :sessions
  resources :businesses do
    resources :bandangos
  end

  namespace :api do
    resources :transacciones
  end

  # sidekiq:
  mount Sidekiq::Web, at: "/sidekiq_web", :constraints => AdminConstraint.new
end
