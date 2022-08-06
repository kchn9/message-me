Rails.application.routes.draw do
  root "chatroom#index"
  # session
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/login", to: "sessions#destroy"
  # users
  get "/sign-up", to: "users#new"
end
