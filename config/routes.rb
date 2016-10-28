Rails.application.routes.draw do
	root 'users#index'
	resources :users 
	resources :sessions
	resources :songs
#	post '/sessions' => 'sessions#create'
#	post '/users' => 'users#create'
#  get '/songs' => 'songs#index'
#	post '/songs' => 'songs#create'
	delete '/sessions' => 'sessions#destroy'
#  get 'songs/new'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
