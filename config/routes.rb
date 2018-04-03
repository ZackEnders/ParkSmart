Rails.application.routes.draw do
  root 'welcome#index'

  get '/profile/:username', to:"users#profile", as:"user_profile"

  devise_for :users
 
  resources :parkingspots do
  	resources :reservations, only: [:create, :show]
  	# get '/:reservation_id', to: 'reservations#show', as: :reservation_confirmation
	end

end
