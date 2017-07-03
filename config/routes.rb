Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :subscribers, only: [:new, :create]
  get '/dancers', to: 'subscribers#dancer'
  get "/paginas/:id" => 'high_voltage/pages#show'
  get '/', to: 'subscribers#new'
  #get 'pages/:id' => 'high_voltage/pages#show', id: 'home'

  #root 'subscribers#new'

  devise_for :users, controllers: { confirmations: 'confirmations' }

  # get '/:locale' => 'subscribers#new'
  #
  #
  #
  # scope "/:locale", locale: /en|es/ do
  #   get "/pages/:id" => 'high_voltage/pages#show', :as => :page, :format => false
  #   get '/dancers', to: 'subscribers#dancer'
  # end

end
