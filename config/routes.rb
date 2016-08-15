Rails.application.routes.draw do
  
  resources :parameters
  resources :juries
  resources :participants
  devise_for :users
end
