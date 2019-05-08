Rails.application.routes.draw do

  devise_for :users

  root 'items#index'

  resources :items do
    member do
      get :buy
      post :pay
    end
  end

  resources :users do
    get :signout
  end
end
