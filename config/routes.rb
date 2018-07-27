Rails.application.routes.draw do
  get 'categories/index'
  root 'static_pages#home'
  
  get '/signup', to: 'users#new'

  post '/login',    to: 'session#create'
  delete '/logout', to: 'session#destroy'

  resources :users, except: :new do
    member do
      get "following", "followers"
    end
  end

  namespace :admin do
    resources :categories do
      resources :words
    end
  end
      
  resources :lessons, only: [:create, :show, :update] do
    resources :lesson_words, only: [:create, :show, :update], path: 'words'
  end

  resources :relationships, only: [:create, :destroy]
end