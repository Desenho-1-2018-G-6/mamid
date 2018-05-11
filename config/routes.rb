Rails.application.routes.draw do
  get 'welcome/index'

  root 'welcome#index'

  resources :admins
  resources :products
  resources :users

  resource :cart, only: [:show]
  resources :order_items, only: [:create, :update, :destroy]

  root 'sessions#new'
  get 'sessions/new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  get '/logout',  to: 'sessions#destroy'
end