Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  resources :items do
    get :check
  end

  resources :users do
    get :signout
    get :listing
  end
end
