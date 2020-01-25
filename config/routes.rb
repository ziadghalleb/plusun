Rails.application.routes.draw do
  devise_for :users

  get 'home', to: 'pages#home', as: :home
  root to: 'pages#home'

  get 'dashboard', to: 'pages#dashboard', as: :dashboard

  # Routes for the Service Model
  resources :services do
    resources :bookings, only: [:create]
  end

  # Routes for the Booking Model


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
