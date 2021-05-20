Rails.application.routes.draw do
  resources :users do 
    resources :taskklist, only:[:new, :create, :index, :show, :edit, :update]
  end

  resources :tasks, only: [:new, :create, :index]

  resources :groups, only: [:show, :index, :new, :create]

  # Session Routes
  get "/login", to: "sessions#new"
  post "/login", to: "session#create"
  get "/logout", to: "sessions#logout"
  post "logout", to: "sessions#destroy"
  # User signup routes
  get "/signup", to: "users#new"
end
