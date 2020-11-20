Rails.application.routes.draw do
  resources :events
  get 'sessions/new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'homes/index'

  resources :articles

  #root 'homes#index'

  root 'sessions#new'

  # get '/users/index'

  get 'signup' => 'users#new'

  # get 'login' => 'sessions#new'

  post 'login' => 'sessions#create'

  get 'logout' => 'sessions#destroy'

  get 'calender' => 'events#index'

  resources :users
end
