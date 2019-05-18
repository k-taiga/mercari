Rails.application.routes.draw do

  devise_for :users

  root 'items#index'

  resources :items do
    member do
      get :buy
      post :pay
      get :purchase
      get :look
    end
  end

  resources :users do
    member do
      get :signout
      get :listing
    end
  end

  resources :credits do
    collection do
      get 'index'
      get 'complete', to: 'credits#complete'
      post 'payment', to: 'credits#payment'
      post 'show', to: 'credits#show'
      post 'pay', to: 'credits#pay'
      post 'delete', to: 'credits#delete'
    end
  end
end
