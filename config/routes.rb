Beatnode::Application.routes.draw do
  root            to: 'pages#home'
  get '/crate',   to: 'pages#crate'
  get '/uploads', to: 'pages#uploads'

  get    '/sign_in',                 to: 'sessions#new'
  delete '/sign_out',                to: 'sessions#destroy'
  match  '/auth/:provider/callback', to: 'sessions#create', via: [:get, :post]

  resources :users,          only: [:show]
  resources :collaborations, only: [:create]
  resources :cratings,       only: [:create]

  resources :sounds, only: [:new, :create, :show] do
    member do
      get :download
    end
  end
end
