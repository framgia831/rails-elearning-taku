Rails.application.routes.draw do
  root 'static_pages#home'
  
  get '/signup', to: 'users#new'

  post '/login', to: 'session#create'
  delete '/logout', to: 'session#destroy'

  resources :users, except: :new do
    member do
      get "following", "followers"
    end
  end
  resources :relationships, only: [:create, :destroy]
end
