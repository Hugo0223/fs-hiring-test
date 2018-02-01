Rails.application.routes.draw do
  resources :bookings , only: [:index, :show]
  resources :motels, only: [:index, :show] do 
 		resources :rooms ,  only: [:index, :show]

  end
	devise_for :users, controllers: { sessions: "users/sessions" }
  
  get '/home', to: 'home#index', as: 'home'
  root :to => 'home#index'
end
