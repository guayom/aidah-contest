Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :subscribers, only: [:new, :create]
  get '/dancer', to: 'subscribers#dancer'
  root 'subscribers#new'

  get '/:locale' => 'subscribers#new'

  devise_for :users, controllers: { confirmations: 'confirmations' }

  scope "/:locale", locale: /en|es/ do
    get "/pages/:id" => 'high_voltage/pages#show', :as => :page, :format => false
  end

end
