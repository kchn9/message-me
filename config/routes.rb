Rails.application.routes.draw do
  root "chatroom#index"
  # session
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  # users
  get "/sign-up", to: "users#new"
  resource :users, except: [:new]
end
