Rails.application.routes.draw do
  get '/signup', to: 'users#new'
  resources :users, except: :new
  
  root 'static_pages#home'

end
