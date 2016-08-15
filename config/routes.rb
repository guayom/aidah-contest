Rails.application.routes.draw do
  
  resources :participants
  devise_for :users
end
