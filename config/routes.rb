Rails.application.routes.draw do
  root to: 'categories#index'

  # Override the params accepted in the User Registration
  devise_for :users, controllers: { registrations: 'user/registrations' }

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
    resources :payments, only: :new
  end

  resources :categories do
    resources :items, only: [:index, :show] do
      post "add", to: "orders#add"
      post "buy", to: "orders#buy"
      resources :reviews, only: [:create]
    end
  end
end
