Rails.application.routes.draw do
  get 'sessions/new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'homes/index'
  get 'homes/ta_index'
  get 'users/index'

  root 'sessions#new'
  
  # get 'home' => 'homes#index'

  get 'signup' => 'users#new'

  post 'login' => 'sessions#create'

  get 'logout' => 'sessions#destroy'

  get 'calendar' => 'events#index'

  resources :users
  resources :events
  resources :messages, :only => [:create]
  resources :rooms, :only => [:create, :show, :index]
end
