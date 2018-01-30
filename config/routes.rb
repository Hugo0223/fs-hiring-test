Rails.application.routes.draw do
  resources :bookings , only: [:index, :show]
  resources :rooms ,  only: [:index, :show]
  resources :motels, only: [:index, :show]
	devise_for :users, controllers: { sessions: "users/sessions" }
  
  get '/home', to: 'home#index', as: 'home'
end
