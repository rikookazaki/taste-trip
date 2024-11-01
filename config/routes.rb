Rails.application.routes.draw do
  devise_for :users
  root to: "restaurants#index"
  resources :restaurants do
    resource :favorites, only: [:create, :destroy]
  end
  resources :users, only: :show
end
