Rails.application.routes.draw do
  # Devise Authentication Routes
    devise_for :users

  # User Routes
    resources :users, only: [:index, :show, :edit, :update] do 
      resources :tasklists
    end

  # Task Routes
    resources :tasks, only: [:new, :create, :index]

  # Group Routes
    resources :groups, only: [:show, :index, :new, :create]

  # Root Page
    root to: 'sessions#welcome'


	devise_scope :user do
    get 'login', to: 'devise/sessions#new'
    get 'sign_up', to: 'devise/registrations#new'
    delete '/logout', to: 'sessions#destroy'
  end
  






end
#