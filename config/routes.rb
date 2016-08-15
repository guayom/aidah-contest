Rails.application.routes.draw do
  
  resources :groups
  resources :parameters
  resources :juries
  resources :participants
  devise_for :users
end
