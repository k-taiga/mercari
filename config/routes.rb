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

  resources :credits, only: [:new, :show] do
    collection do
      post 'show', to: 'credits#show'
      post 'pay', to: 'credits#pay'
    post 'delete', to: 'credits#delete'
    end
  end
end
