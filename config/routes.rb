Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :subscribers, only: [:new, :create]
  get '/dancer', to: 'subscribers#dancer'
  root 'subscribers#new'

  devise_for :users, controllers: { confirmations: 'confirmations' }
end
