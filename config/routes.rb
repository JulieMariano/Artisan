Rails.application.routes.draw do
  devise_for :users

  root to: 'categories#index'
  
  namespace :admin do
    resources :items do
      resources :orders
    end
  end

  resources :users do
    resources :items 
  end

  resources :categories do
    resources :items, only: [:index, :show] do
      resources :orders, only: [:create, :destroy]
    end
  end

  # get 'my_orders', to: 'orders#my_orders' 

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
