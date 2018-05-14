Rails.application.routes.draw do
  get 'welcome/index'

  root 'welcome#index'

  resources :admins
  resources :products
  resources :users
  
  get 'manage_user/index', as: :manage_user
  post '/change_permission' => 'manage_user#update_permission', as: :update_permission_manage_user
  resources :manage_user

  resource :cart, only: [:show]
  resources :order_items, only: [:create, :update, :destroy]

  root 'sessions#new'
  get 'sessions/new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  get '/logout',  to: 'sessions#destroy'
end