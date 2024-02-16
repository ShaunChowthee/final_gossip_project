Rails.application.routes.draw do
  resources :sessions, only: [:new, :create, :destroy]
  resources :gossips
  resources :cities
  resources :users
  
  root "home#index"
  get '/home', to: "home#index"
  get '/home/:name', to: "home#index"
  get '/team', to: "home#team"
  get '/contact', to: "home#contact"
  get '/logout', to: 'sessions#destroy'


end
