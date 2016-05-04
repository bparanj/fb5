Rails.application.routes.draw do
  resources :friendships
  resources :sessions
  resources :users
  
  root 'users#index'
end
