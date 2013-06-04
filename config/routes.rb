require 'sidekiq/web'

Sparklr::Application.routes.draw do

  get "home/show"

  get "dropbox/create"
  get "dropbox/authorize"

  resources :users

  get 'tags/:tag', to: 'sparks#index', as: :tag

  mount Sidekiq::Web, at: "/sidekiq"

  scope "/:user_slug" do
    resources :sparks
    get "/" => "sparks#index"
    put "update_from_dropbox" => "sparks#update_from_dropbox"
  end

  root :to => 'home#show'
end
