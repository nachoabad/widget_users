Rails.application.routes.draw do
  resources :users
  resources :widgets
  resource  :my_widgets, only: :show

  root 'widgets#index'
end
