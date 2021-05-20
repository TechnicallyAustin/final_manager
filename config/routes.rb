Rails.application.routes.draw do
  resources :users do 
    resources :taskklist, only:[:new, :create, :index, :show, :edit, :update]
  end

  resources :tasks, only: [:new, :create, :index]

  resources :groups, only: [:show, :index, :new, :create]

  # Session Routes
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/login'
  get 'sessions/welcome'

  get "login", to: "sessions#new"
  post "login", to: "session#create"
  get "logout", to: "sessions#logout"
  post "logout", to: "sessions#destroy"
  # User  routes
  get "/signup", to: "users#new"
  post "signup", to: "users#create"
  get "profile", to: 'users#show'

  
  # Home Page
  get '/', to: "sessions#welcome"
end
