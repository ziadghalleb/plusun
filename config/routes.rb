Rails.application.routes.draw do
  devise_for :users

  get 'home', to: 'pages#home', as: :home
  root to: 'pages#home'

  # Routes for the Service Model
  resources :services

  # Routes for the Booking Model
  resources :bookings

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
