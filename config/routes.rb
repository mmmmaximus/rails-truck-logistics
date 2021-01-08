Rails.application.routes.draw do
  root 'home#index'

  resources :admins
  resources :sessions, only: [:new, :create, :destroy]

  get 'signup', to: 'admins#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  resources :home, only: :index
  resources :trucks
  resources :drivers
  resources :routes
  resources :cargos
  resources :model_types
  resources :trains
end
