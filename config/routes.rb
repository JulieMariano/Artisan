Rails.application.routes.draw do
  # Home page
  root to: 'categories#index'

  # Stripe's Webhook Event
  mount StripeEvent::Engine, at: '/stripe-webhooks'

  # Sidekiq Web UI, only for Admins
  require "sidekiq/web"
  authenticate :user, ->(user) { user.is_admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end

  # Devise default routes for User
  # Override the params accepted in the User Registration
  # Do not include the 'password' controller
  devise_for :users, skip: 'password', controllers: { registrations: 'user/registrations' }

  # Admin actions
  namespace :admin do
    resources :categories do
      resources :items, except: [:show]
    end
  end

  # Standard Website layout
  resources :categories, only: [:index] do
    resources :items, only: [:index, :show] do
      post "add", to: "orders#add"
      post "buy_one", to: "orders#buy_one"

      resources :reviews, only: [:create]
    end
  end

  resources :orders, only: [:index, :show] do
    post "buy_all", to: "orders#buy_all"
  end

  resources :orders_items, only: [:destroy, :update]
end
