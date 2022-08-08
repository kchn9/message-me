Rails.application.routes.draw do
  root "chatroom#index"
  # messsage
  post "/messsage", to: "messages#create"
  # session
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/login", to: "sessions#destroy"
  # users
  get "/sign-up", to: "users#new"
  match "/sign-up", via: :post, to: "users#create"
  resources :users, only: [:show, :edit, :update]
end
