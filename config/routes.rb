Rails.application.routes.draw do
  devise_for :users
  root to: 'journals#index'
  resources :journals, only: [:index, :new, :create]
end
