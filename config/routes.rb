Rails.application.routes.draw do

  post '/login', to: 'session#create'
  delete '/logout', to: 'session#destroy'
  get '/signup', to: 'users#new'
  resources :users, except: :new
 
  root 'static_pages#home'

end
