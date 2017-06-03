Rails.application.routes.draw do
  resources :subscribers, only: [:new, :create]
  root 'subscribers#new'

  devise_for :users, controllers: { confirmations: 'confirmations' }
end
