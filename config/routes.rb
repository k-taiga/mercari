Rails.application.routes.draw do
  devise_for :users
  root 'mercaris#index'
  resources :items
end
