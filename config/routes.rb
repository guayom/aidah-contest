Rails.application.routes.draw do

  resources :participant_ratings
  resources :votes
  resources :categories

  get '/participante/:id', to: 'participants#show', as: 'participante'
  resources :participants do
    member do
      post 'upvote'
    end
    resources :participant_ratings
  end

  resources :groups
  resources :parameters
  resources :juries

  get '/user/:id', to: 'users#show'

  devise_for :users
end
