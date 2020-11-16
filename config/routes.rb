Rails.application.routes.draw do
  get 'startup/index'
  root to: 'startup#index'
  resources :trucks
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
