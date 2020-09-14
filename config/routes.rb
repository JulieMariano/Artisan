Rails.application.routes.draw do
  root to: 'categories#index'
  
  devise_for :users

  namespace :admin do
    resources :categories do
      resources :items do
        resources :orders
      end
    end
  end

  resources :users do
    resources :items 
  end

  resources :orders, only: [:index, :destroy] do
    collection do
      post "buy_all", to: "orders#buy_all"
      post "buy_one", to: "orders#buy_one"
    end

    resources :payments, only: :new
  end

  resources :categories do
    resources :items, only: [:index, :show] do
      resources :orders, only: [:create]
      resources :reviews, only: [:create]
    end
  end
end
