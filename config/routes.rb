Rails.application.routes.draw do

  resources :categories

  get '/participante/:id', to: 'participants#show', as: 'participante'
  resources :participants

  resources :groups
  resources :parameters
  resources :juries

  devise_for :users
end
