Rails.application.routes.draw do
  resources :startup, only: [:index]
  root to: 'startup#index'
  resources :trucks
  resources :drivers
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
