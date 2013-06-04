require 'sidekiq/web'

Sparklr::Application.routes.draw do

  get "home/show"

  get "dropbox/create"
  get "dropbox/authorize"

  resources :users

  scope "/:user_slug" do
    get "/" => "sparks#index"
    resources :sparks
    put "update_from_dropbox" => "sparks#update_from_dropbox"
  end

  mount Sidekiq::Web, at: "/sidekiq"

  root :to => 'home#show'
end
