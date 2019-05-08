Rails.application.routes.draw do

  devise_for :users

  root 'items#index'

  resources :items do
    collection do #resouse外に作成する際はcollection doを使って記述する
      post #'アクション名'
    end
  end

  resources :users do
    get :signout
  end
end
