Rails.application.routes.draw do
  # Devise Authentication Routes
    devise_for :users, controllers: {omniauth_callbacks: 'omniauth'}

  # User Routes
    resources :users, only: [:index, :show, :edit, :update] 

  # Task Routes
    resources :tasks, only: [:index]

  # Group Routes
    resources :groups, only: [:show, :index, :edit, :update]

  # Tasklists Routes
    resources :tasklists, only: [:index, :new, :show, :create, :edit, :update] do
      resources :tasks, only: [:show, :edit, :update, :new, :create]
    end

  # Redirects
    # Tasklists
    #get 'tasklists/new', to: 'tasklists#new' # New Tasklist
    #get 'tasklists/:tasklist_id/tasks/new', to: 'tasks#new' # New Task Within a Tasklist
    #get 'tasklists/:tasklist_id/tasks/:task_id', to: 'tasks#show' # Single Task on a Tasklist
    #post 'tasklists/:id/edit', to: 'tasklists#edit' # Edit a Single Tasklist
    patch 'tasklists/:tasklist_id/tasks/:task_id/edit', to: 'tasks#update' # renders the nested tasklist taks edit form
    #get 'tasklists/:tasklist_id/tasks/:task_id/edit', to: 'tasks#edit' # posts the tasklist's task and processes the updates
  
    # Tasks
      post '/tasks', to: "tasks#create"

    # Root Page
      root to: 'sessions#welcome'

    # Devise Routes
  	  devise_scope :user do
        get 'login', to: 'devise/sessions#new'
        get 'sign_up', to: 'devise/registrations#new'
        delete '/logout', to: 'sessions#destroy'
      end
end
