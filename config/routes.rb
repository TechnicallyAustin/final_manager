Rails.application.routes.draw do
  # Devise Authentication Routes
    devise_for :users

  # User Routes
  # user does not need to have tracklists nested, I can just authenticate the routes

    resources :users, only: [:index, :show, :edit, :update] do 
      #resources :tasklists, only: [:index]
    end
    #get 'profile', to: 'users#show'

  # Task Routes
    resources :tasks, only: [:index]
    #get 'tasks/new', to: 'tasks#new'
    #post "tasks/new", to: 'tasks#create'
  # Group Routes
    resources :groups, only: [:show, :index, :new, :create]

  # Tasklists Routes
  ### Considering nesding tasks within tasklists for easier navigation.
    resources :tasklists, only: [:index, :new, :show, :create, :edit, :update] do
      resources :tasks, only: [:show, :edit, :update, :new, :create]
    end

    get 'tasklists/new', to: 'tasklists#new'
    post 'tasklists/:id/edit', to: 'tasklists#edit'
    get "tasklists/#{:id}/tasks/new", to: 'tasks#new'
    post "taskslists/#{:id}/tasks/new", to: 'tassks#create'
  # Root Page
    root to: 'sessions#welcome'


	devise_scope :user do
    get 'login', to: 'devise/sessions#new'
    get 'sign_up', to: 'devise/registrations#new'
    delete '/logout', to: 'sessions#destroy'
  end
  






end
#