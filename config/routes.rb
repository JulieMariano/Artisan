Rails.application.routes.draw do
  root to: 'categories#index'

  # Stripe's Webhook Event
  mount StripeEvent::Engine, at: '/stripe-webhooks'

  # Sidekiq Web UI, only for admins.
  require "sidekiq/web"
  authenticate :user, ->(user) { user.is_admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end

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

  resources :orders_items, only: [:destroy, :update]

  resources :orders, only: [:index, :show, :destroy] do
    collection do
      post "buy_all", to: "orders#buy_all"
    end

    resources :payments, only: :new
  end

  resources :categories do
    resources :items, only: [:index, :show] do
      post "add", to: "orders#add"
      post "buy_one", to: "orders#buy_one"
      resources :reviews, only: [:create]
    end
  end
end
