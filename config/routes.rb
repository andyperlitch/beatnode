Beatnode::Application.routes.draw do
  root to: 'pages#home'

  get   '/sign_in',                 to: 'sessions#new'
  match '/auth/:provider/callback', to: 'sessions#create', via: [:get, :post]

  resources :users,          only: [:show]
  resources :nodes,          only: [:new, :create, :show]
  resources :samplings,      only: [:create]
  resources :collaborations, only: [:create]
  resources :cratings,       only: [:create]
end
