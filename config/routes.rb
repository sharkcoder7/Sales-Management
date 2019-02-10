Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  resources :users


  get '/signin', to: 'sessions#new', as: 'signin'

  get '/items/new', to: 'items#new', as: 'new_item'
  get '/items/edit', to: 'items#edit', as: 'edit_item'
  post '/items', to: 'items#create'
  post '/items', to: 'items#update'

  get '/deals/under_fifty', to: 'deals#under_fifty'
  
  resources :items, only: [:show, :index] do
    resources :deals, only: [:show, :index, :new]
  end



  resources :deals, only: [:index, :show, :new, :create, :edit, :update]

  resource :sessions, only: [:new, :create, :destroy]

  root 'static_pages#home'



  get '/auth/facebook/callback', to: 'sessions#create'
end
