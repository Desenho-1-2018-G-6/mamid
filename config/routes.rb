Rails.application.routes.draw do

  get 'welcome/index'

  root 'welcome#index'

  resources :admins
  resources :products
  resources :users

  get 'sessions/new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  get '/logout',  to: 'sessions#destroy'
  
  get 'cart/:id',         to: 'carts#show'
  get 'cart/:id/update',  to: 'carts#update'
  get 'cart/:id/destroy', to: 'carts#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
