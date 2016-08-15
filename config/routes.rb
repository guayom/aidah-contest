Rails.application.routes.draw do

  resources :votes
  resources :categories

  get '/participante/:id', to: 'participants#show', as: 'participante'
  resources :participants do
    resources :votes
  end

  resources :groups
  resources :parameters
  resources :juries

  devise_for :users
end
