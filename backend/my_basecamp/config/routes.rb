Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "users#index"

  # Define user routes
  get "/signup", to: "users#new"
  post "/users", to: "users#create"
  get "/users/:id", to: "users#show"
  delete "/users/:id", to: "users#destroy"

  # Define sessions routes
  get "signin", to: "sessions#new"
  post "signin", to: "sessions#create"
  get  "signout", to: "sessions#destroy"

  # Define projects routes
  resources :users do
    resources :projects
  end

end
