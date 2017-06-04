Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :subscribers, only: [:new, :create]
  root 'subscribers#new'

  devise_for :users, controllers: { confirmations: 'confirmations' }
end
