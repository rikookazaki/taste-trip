Rails.application.routes.draw do
  devise_for :users
  root to: "restaurants#index"
  resources :restaurants do
    member do
      patch :approve
    end
    collection do
      get :introduce
    end
    resource :favorite, only: [:create, :destroy]
  end
  resources :users, only: :show
end
