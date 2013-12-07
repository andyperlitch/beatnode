# beatnode

[![Build Status](https://travis-ci.org/alexgenco/beatnode.png)](https://travis-ci.org/alexgenco/beatnode)


## Endpoints

- GET      /                                  sessions#new
- GET      /sign_in(.:format)                 sessions#new
- DELETE   /sign_out(.:format)                sessions#destroy
- GET|POST /auth/:provider/callback(.:format) sessions#create
- GET      /users/:id(.:format)               users#show
- POST     /collaborations(.:format)          collaborations#create
- POST     /cratings(.:format)                cratings#create
- GET      /sounds/:id/download(.:format)     sounds#download
- POST     /sounds(.:format)                  sounds#create
- GET      /sounds/:id(.:format)              sounds#show