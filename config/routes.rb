Sparklr::Application.routes.draw do
  resources :sparks


  get "dropbox/create"
  get "dropbox/authorize"

  resources :users

  # root :to => 'welcome#index'
end
