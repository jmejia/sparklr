Sparklr::Application.routes.draw do
  get "dropbox/create"
  get "dropbox/authorize"

  resources :users

  # root :to => 'welcome#index'
end
