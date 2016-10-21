Rails.application.routes.draw do
  resources :users
  resources :sessions
  resources :products
  get 'products/dashboard'

  get 'products/show'
  get 'sessions/create'
  get 'sessions/destroy'

  root 'users#main'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
