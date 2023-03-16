Rails.application.routes.draw do
  devise_for :users
  root to: 'journals#index'
  resources :journals, only: [:index, :new, :create, :destroy] do
    resources :events, only:[:index, :new, :create, :edit, :update, :destroy]
  end
end
