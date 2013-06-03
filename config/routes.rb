require 'sidekiq/web'

Sparklr::Application.routes.draw do
  resources :sparks


  get "dropbox/create"
  get "dropbox/authorize"

  resources :users


  mount Sidekiq::Web, at: "/sidekiq"

  # root :to => 'welcome#index'
end
