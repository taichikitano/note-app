Rails.application.routes.draw do
  devise_for :users
  root to: "folders#index"
  resources :users, only: [:edit, :update]
  resources :folders do
    resources :notes
  end

end
