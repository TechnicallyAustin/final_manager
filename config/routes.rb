Rails.application.routes.draw do
  # Devise Authentication Routes
    devise_for :users

  # User Routes
    resources :users, only: [:index, :show, :edit, :update] do 
      resources :tasklists, only: [:index]
    end
    #get 'profile', to: 'users#show'



  # Task Routes
    resources :tasks, only: [:new, :create, :index, :show]
    get 'tasks/new', to: 'tasks#new'
    post "tasks/new", to: 'tasks#create'
  # Group Routes
    resources :groups, only: [:show, :index, :new, :create]

  # Tasklists Routes
    resources :tasklists, only: [:new, :show, :create, :edit, :update]
    post 'tasklists/new', to: 'tasklists#new'
  # Root Page
    root to: 'sessions#welcome'


	devise_scope :user do
    get 'login', to: 'devise/sessions#new'
    get 'sign_up', to: 'devise/registrations#new'
    delete '/logout', to: 'sessions#destroy'
  end
  






end
#