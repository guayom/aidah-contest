Rails.application.routes.draw do

  resources :categories do
    resources :participants
  end

  resources :groups
  resources :parameters
  resources :juries

  devise_for :users
end
