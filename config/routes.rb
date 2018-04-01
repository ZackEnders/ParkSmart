Rails.application.routes.draw do
  root 'welcome#index'

  get '/profile/:username', to:"users#profile", as:"user_profile"

  devise_for :users

  resources :parking_spots do
  	resources :rents

	end

end
