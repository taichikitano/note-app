Rails.application.routes.draw do
  devise_for :users
  root to: "notes#index"
  resources :users, only: [:edit, :update]
  resources :folders, only: [:new, :create]
end
