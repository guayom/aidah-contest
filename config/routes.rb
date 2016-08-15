Rails.application.routes.draw do
  
  resources :juries
  resources :participants
  devise_for :users
end
