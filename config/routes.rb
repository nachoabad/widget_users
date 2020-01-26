Rails.application.routes.draw do
  get    '/signup',  to: 'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  
  resources :users
  resources :widgets
  resource  :my_widgets, only: :show

  root 'widgets#index'
end
