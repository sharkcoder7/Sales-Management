Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  get '/users/new', to: 'users#new', as: 'new_user'
  get '/users', to:'users#index', as: 'users'
  post '/users', to:'users#create'
  get '/users/:id', to: 'users#show', as: 'user'

  get '/signin', to: 'session#new', as: 'signin'
  post '/session', to: 'session#create', as: 'session'
  delete '/session/', to: 'session#destroy'

  get '/items', to: 'items#index', as: 'items'
  get '/items/new', to: 'items#new', as: 'new_item'
  post '/items', to: 'items#create'
  get '/items/:id', to: 'items#show', as: 'item' 

  get '/deals', to: 'deals#index', as: 'deals'
  get '/deals/new', to: 'deals#new', as: 'new_deal'
  post '/deals', to: 'deals#create'
  get '/deals/id', to: 'deals#show', as: 'deal'
end
