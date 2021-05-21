Rails.application.routes.draw do
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
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  # Home Page
  get '/', to: "sessions#welcome"
  root to: 'users#new'

	
	# create (post) action for when sign up form is submitted:
	post 'users' => 'users#create'






end
#