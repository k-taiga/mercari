Rails.application.routes.draw do

  devise_for :users

  root 'items#index'

  resources :items do
    member do
      get :buy
      post :pay
      get :purchase
    end
  end

  resources :users do
    get :signout
  end

  resources :credits, only: [:index, :new]
end
