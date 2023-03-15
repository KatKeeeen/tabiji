Rails.application.routes.draw do
  devise_for :users
  root to: 'journals#index'
  resources :journals, only: [:index, :new, :create, :show, :destroy] do
    resources :events, only:[:index, :new, :create, :destroy]
  end
end
