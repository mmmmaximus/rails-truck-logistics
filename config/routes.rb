Rails.application.routes.draw do
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  resources :users
  root 'home#index'

  resources :users
  resources :sessions, only: [:new, :create, :destroy]

  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  get 'home/index'
  resources :startup, only: [:index]
  # root to: 'startup#index'
  resources :trucks
  resources :drivers
  resources :routes
  resources :cargos
  resources :model_types
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
