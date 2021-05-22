Rails.application.routes.draw do

  devise_for :users
  resources :users do 
    resources :taskklist, only:[:new, :create, :index, :show, :edit, :update]
  end

  resources :tasks, only: [:new, :create, :index]

  resources :groups, only: [:show, :index, :new, :create]

  # Session Routes
  #get 'sessions/new'
  #get 'sessions/create'
  #get 'sessions/login'
  #get 'sessions/welcome'

# Redirects 


  # Home Page
  get '/', to: "sessions#welcome"
  root to: 'users#new'

	






end
#