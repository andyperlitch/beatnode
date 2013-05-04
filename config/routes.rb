Beatnode::Application.routes.draw do
  root to: 'pages#home'

  get '/sign_in', to: 'sessions#new'

  match '/auth/:provider/callback', to: 'sessions#create', via: [:get, :post]

  resources :nodes, only: [:new, :create]
  resources :users, only: [:show]
end
