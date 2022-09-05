Rails.application.routes.draw do
  root "welcome#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :articles do
    resources :comments
  end
  resources :users

  get "signup", to: "users#new", as: "signup"
  get "login", to: "sessions#new", as: "login"
  post "login", to: "sessions#create"
  get "logout", to: "sessions#destroy", as: "logout"

end
