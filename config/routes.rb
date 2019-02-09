Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/users/new', to: 'users#new', as: 'new_user'
  get '/signin', to: 'session#new', as: 'signin'
end
