Rails.application.routes.draw do

  devise_for :users

  root 'items#index'

  resources :items do
    member do
      get :buy
      post :pay
      get :check
    end
  end

  resources :users do
    get :signout
    get :listing
  end
end
