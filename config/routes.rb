Beatnode::Application.routes.draw do
  root to: 'pages#home'

  get '/sign_in', to: 'sessions#new'

  match '/auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
end
