Rails.application.routes.draw do
  get 'welcome/index'
  # comentar o root welcome depois
  root 'welcome#index'
  resources :products
  resources :users
  root 'sessions#new'
  get 'sessions/new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  get '/logout',  to: 'sessions#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
