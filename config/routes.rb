Rails.application.routes.draw do
  resources :bookings
  resources :rooms
  resources :motels
	devise_for :users, controllers: { sessions: "users/sessions" }
  
  get '/home', to: 'home#index', as: 'home'
end
