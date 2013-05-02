Beatnode::Application.routes.draw do
  get '/sign_in', to: 'sessions#new'

  match '/auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
end
